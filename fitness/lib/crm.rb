module CrmIntegration

  require 'net/http'
  require 'json'

  def performRequest(method, url, data)

    authorization = 'eyJvcmdhbml6YXRpb24iOiJodHRwczovL2l0YWx0aWxlLnRhbmdlbnRjcm0uY28uemEvIiwidXNlcm5hbWUiOiJ0YW5nZW50Y3JtXFxUZXN0MSIsInBhc3N3b3JkIjoiVCRUMyQ3MSJ9'

    uri = URI(url)

    if method == "POST"

      Net::HTTP.start(uri.host, uri.port) do |http|

        request = Net::HTTP::Post.new uri.request_uri
        request.content_type = 'application/json'
        request["Authorization"] = "TCRM-JSON #{authorization}"
        request.set_form_data(data)
        response = http.request request # Net::HTTPResponse object
        return response.body

      end

    elsif method == "GET"

      Net::HTTP.start(uri.host, uri.port) do |http|

        request = Net::HTTP::Get.new uri.request_uri
        request.content_type = 'application/json'
        request["Authorization"] = "TCRM-JSON #{authorization}"
        response = http.request request # Net::HTTPResponse object
        return response.body

      end

    end

  end
  def createNewContact(firstname, lastname, emailAddress, phoneNumber)

    contactData = Array(
        'firstname'			=> firstname,
        'lastname'			=> lastname,
        'emailaddress1'		=> emailAddress,
        'mobilephone'    => phoneNumber
    )
    return performRequest('POST', 'http://athena.tangentcrm.co.za/crm.api/api/contact/', contactData);

  end

  def getEntityStructure(entity, requiredOnly = false)

    meta = Array.new()
    structure = JSON.parse(performRequest('GET', "http://athena.tangentcrm.co.za/crm.api/api/#{entity}/meta", nil))
    structure.each do |item|
      if ((not item["required"]) && requiredOnly) || (not item["writeable"])
        next
      end
      metaItem = { "name" => item["name"], "type" => item["type"], "required" => item["required"] }
      meta.push(metaItem)
    end
    return meta

  end

  def createNewLead(firstname, lastname, phoneNumber, emailAddress, subject)

    data = Array("ts_leadtype" => "Retail Store", "firstname" => firstname, "lastname" => lastname, "emailaddress1" => emailAddress, "mobilephone" => phoneNumber, "subject" => subject)
    return performRequest('POST', 'http://athena.tangentcrm.co.za/crm.api/api/lead/', data);

  end



  def createNewOpportunity(customerId, subject)

    data = Array(
        'transactioncurrencyid'		=> 'Rand',
        'customeridtype'			=> 'contact',
        'customerid'				=> customerId,
        'name'						=> subject
    )
    return performRequest('POST', 'http://athena.tangentcrm.co.za/crm.api/api/opportunity/', data);

  end


  #puts("Lead Structure\r\n\r\n")
  #meta = getEntityStructure("lead", true) # make this false to see all fields
  #if meta.empty?
  #  puts("No required fields")
  #else
  #  puts(meta)
  #end
  #puts("\r\n\r\n")
#
#
  #puts("Opportunity Structure\r\n\r\n")
  #meta = getEntityStructure("opportunity", true) # make this false to see all fields
  #if meta.empty?
  #  puts("No required fields")
  #else
  #  puts(meta)
  #end
  #puts("\r\n\r\n")
#
  #puts("\r\nCreate New Lead\r\n")
  #result = JSON.parse(createNewLead("Justin", "Robertson", "0720411951", "justin@tangentsolutions.co.za", "testing ignore"))
  #puts(result["id"])
  #puts("\r\n\r\n")
#
  #puts("\r\nCreate New Contact\r\n")
  #result = JSON.parse(createNewContact("Justin", "Robertson", "justin@tangentsolutions.co.za"))
  #puts(result["id"])
  #contactId=result["id"]
  #puts("\r\n\r\n")
#
  #puts("\r\nCreate New Opportunity\r\n")
  #result = JSON.parse(createNewOpportunity(contactId, "testing ignore"))
  #puts(result["id"])
  #puts("\r\n\r\n")


end