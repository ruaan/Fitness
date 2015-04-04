module MagentoSoapApi
class MagentoSoapApi
  require 'savon'
  def initialize(wsdl, username, password)

    @soaps = Soap.all

      @wsdl = "http://www.italtile.co.za/api/soap/?wsdl"
      @username = "sync"
      @password = "sync_123"

    @client = Savon.client(wsdl: @wsdl)
  end

  def call(path, args = nil)
    response = @client.call(:call,xml: get_request_xml(path,args))
    if response.success?
      return refactor_response(response.to_hash[:call_response][:call_return])
    end
    raise "Failed to complete api call to #{path}"
  end

  def logout
    if @session.present?
      @client.call(:end_session, { message: { session: @session } })
      @session = nil
    end
    return true
  end

  private
  def get_session
    if not @session.present?
      response = @client.call(:login, { message: { username: @username, apiKey: @password }})
      if response.success? == false
        raise SecurityError, "Magento API Login Failed"
      end
      @session = response.body[:login_response][:login_return]
    end
    return @session
  end

  private
  def refactor_response(value)
    if value.is_a?(Hash) && value.has_key?(:item) && value[:item].is_a?(Array) && value[:item].count > 0 && value[:item][0].is_a?(Hash) && value[:item][0].has_key?(:key) && value[:item][0].has_key?(:value) # if unnecessary array wrapper found around key/value pair hash, merge into single hash
      refactor = Hash.new
      value[:item].each do | item |
        if item != nil
          response = refactor_response(item)
          refactor[response.keys[0]] = refactor_response(response[response.keys[0]])
        end
      end
      value = refactor
    elsif value.is_a?(Hash) && value.has_key?(:key) && value.has_key?(:value) # convert :key :value pair to a hash
      value = { value[:key] => refactor_response(value[:value]) }
    elsif value.is_a?(Hash) && value.has_key?(:item) # item key hashed
      value = refactor_response(value[:item])
    elsif value.is_a?(Hash) # process sub-hashes
      refactor = Hash.new
      value.each do | key, item |
        if key != :"@xsi:type" && key != :"@soap_enc:array_type"
          refactor[key] = refactor_response(item)
        end
      end
      value = refactor
    elsif value.is_a?(Array) # process entire array
      refactor = Array.new
      value.each do | item |
        refactor.push(refactor_response(item))
      end
      value = refactor
    end
    return value # if no processing required return plain value
  end

  private
  def get_request_xml(path,args)
    session = get_session
    # todo: add filtering ability for search functions
    builder = Builder::XmlMarkup.new()
    builder.instruct!(:xml, encoding: "UTF-8")

    builder.tag!(
        "env:Envelope",
        "xmlns:env" => "http://schemas.xmlsoap.org/soap/envelope/",
        "xmlns:ns1" => "urn:Magento",
        "xmlns:ns2" => "http://xml.apache.org/xml-soap",
        "xmlns:xsd" => "http://www.w3.org/2001/XMLSchema",
        "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance"
    ) do |envelope|
      envelope.tag!("env:Body") do |body|
        body.tag!("ns1:call") do |call|
          builder.sessionId(session, "xsi:type" => "xsd:string")
          builder.resourcePath(path, "xsi:type" => "xsd:string")
          if args != nil && args.is_a?(Hash)
            builder.args("xsi:type" => "ns2:Map") do |map|
              args.each do |key, value|
                map.item do |item|
                  type = "xsd:string"
                  if value.is_a?(Integer)
                    type = "xsd:integer"
                  end
                  # todo: process array, hash, etc. value types
                  item.key(key, "xsi:type" => type)
                  item.value(value, "xsi:type" => type)
                end
              end
            end
          end
        end
      end
    end

    builder.target!
  end
  end
end