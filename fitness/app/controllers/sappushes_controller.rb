class SappushesController < InheritedResources::Base
  #respond_to :json
  def new
    @sappushs = Sappush.all
    @sappush = Sap.new
  end
  def create
    @b = Array.new
    #RestClient.post 'http://155.208.145.141/PhoneGapService/api/authentication/login', { 'StoreCode' => 'I925', 'Password' => "MYBURG6", 'modelName' => "UserModel", 'Platform' => "MOB", 'Version' => "1.0.7.1"}
    require "uri"
    require "net/http"
    require 'json'
    require 'restclient'

    get_element_from_form

    auth_call

    loop_prep

    @countsub = 0
    @lineitem.each do |f|

      if @a.include?(@lineitem[@countsub].title) == false
      partOne
      partTwo
        #@suom = lineitem.suom

        # if @project.exvat == true
        #     exvat_showprice = showprice * 0.14
        #    number_to_currency(@showprice - exvat_showprice, unit: "R")  ex.vat.
        #
        #        else
        #             number_to_currency(@showprice, unit: "R")
        #             end
        #
        #              else
        #              end



        @b[@countsub] = Hash['CompanyCode' => @storeCode, 'SalesOrganisation' => @storeCode,'DistributionChannel'=> '01', 'ArticleCode'=> @sku, 'ArticleDescription'=> @title, 'ArticleType'=> 'HAWA', 'ItemCategoryGroup'=> 'NORM', 'QtyInSalesUoM'=>  @finalquantity, 'NettInvoicePriceIncVat'=>  @total, 'Currency'=> 'ZAR', 'OneTimeCustomer'=> 'null']

        @countsub = @countsub + 1
      end
    end


   json_data
    rest_api_call

   redirecting_messages
    end

  private
  def partOne
    @found = Lineitem.where(title: @lineitem[@countsub].title,:subsection_id =>@subsectionids ).all
    times = @found.length

    (1..times).each do |d|
      @array = Array.new
      @getItemsinfo = Lineitem.where(id: @found[d-1].id).first

    (1..@found.length).each do |g|

      @getItemsinfo = Lineitem.where(id: @found[g -1].id).first
      @array.push(@getItemsinfo.quantity)
      @a.push(@getItemsinfo.title)

    end

    @finalquantity =@array.inject{|sum,x| sum + x }

    @showprice = @getItemsinfo.price.to_i * times.to_i


    end
  end
  def partTwo
    if @lineitem[@countsub].price.present? == true
      @totals ||= []

      @totals.push(@lineitem[@countsub].price)
      @total = @totals.inject{|sum,x| sum + x }
    end
    if  @lineitem[@countsub].exvat_price.present? == true
     @exvattotals ||= []
     @exvattotals.push(@lineitem[@countsub].exvat_price)
     @subtotal = @exvattotals.inject{|sum,x| sum + x }
    end
     @image = @lineitem[@countsub].image
      @title = @lineitem[@countsub].title
      @sku = @lineitem[@countsub].sku
    end
  def loop_prep

    @quotes = Array.new
    @a = Array.new
    @projectId = Project.where(id:@theProjectid).first
    @account = Account.where(id:@projectId.account_id).first
     @sectionId = Section.where(:project_id => @theProjectid).all
    @subsectionids = Subsection.where(:section_id => @sectionId).ids
    @lineitem = Lineitem.where(:subsection_id => @subsectionids).all
  end
  def get_element_from_form
    @storeCode = params[:storeCode]
    @repCode = params[:repCode]
    @username = params[:username]
    @password = params[:password]
    @theProjectid = params[:projectid]
  end


  def auth_call
    params = { 'StoreCode' => "#{@storeCode}", 'Password' => "#{@password}",'Username' => "#{@username}", 'modelName' => "UserModel", 'Platform' => "MOB", 'Version' => "1.0.7.1"}

    x = Net::HTTP.post_form(URI.parse('http://155.208.145.141/PhoneGapService/api/authentication/login'), params)

    hash = JSON.parse x.body

    @key = hash['Token']

  end
  def redirecting_messages
    session[:return_to] ||= request.referer

    respond_to do |format|

      if @projectId.save
        message =  'was successfully created.'
        format.html { redirect_to session.delete(:return_to), notice:  @message }
        format.json { render action: 'show', status: :created, location: input }
        format.js { render :js => "alert(#{@message});" }

      else

        format.html { render action: 'new' }
        format.json { render json: input.errors, status: :unprocessable_entity }
      end
      end
  end
    def rest_api_call

      data =  RestClient.post "http://155.208.145.141/PhoneGapService/api/quote/processquote", @paramsItems.to_json, :content_type => :json, :accept => :json

      pushData = JSON.parse(data)
      if pushData['Success'] == true
        @projectId.sapCode = pushData['QuoteNumber']
        @projectId.save
        puts  @message = "Successful Save to SAP. Quote number #{pushData['QuoteNumber']}"
      else
        puts  @message = "Failed to push to SAP. #{pushData['Message']}"
      end
    end
    def json_data
      @thecounter = 0
    puts  @paramsItems ={"Quote"=> {
          "PrintQuoteFlag"=> false,
          "EmailQuoteFlag"=> false,
          "CreateProformaFlag"=> false,
          "PrinterName"=> "921D",
          "StoreCode"=> @storeCode,
          "RepCode"=> @repCode,
          "CustomerAddress"=> {
              "Name"=> @account.name,
              "TelNumber1"=> @account.phone,
              "City"=> ".",
              "AccountGroup"=> "ZCLR",
              "Email"=> @account.email,
              "Street"=> "..",
              "VatNo"=> ".",
              "PoBox"=>"0000"
          },
          "CustomerNo"=> "",
          "DeliveryAddress"=> {"DeliveryL1"=>@account.address,"DeliveryL2"=>".","DeliveryL3"=>".","DeliveryL4"=>"."},
          "DeliveryDate"=> Date.today,
          "OriginalQuoteNo"=> "",
          "SapArticles"=>@b,
          "UpdatedSapArticles"=> [],
          "ExistingCustomerAddress"=> {},
          "HeaderText"=> {}
      }, "Token"=> "#{@key.to_s}", "modelName"=> "QuoteModel", "Platform"=> "MOB", "Version"=> "1.0.7.1"
      }
    end
    def sappush_params
      params.require(:sappush).permit(:name)
    end
end

