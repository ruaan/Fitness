class SapsController < InheritedResources::Base
 def new
   @saps = Sap.all
   @sap = Sap.new
 end

  def create
    require "uri"
    require "net/http"
    require 'json'
    require "byebug"
    @sap = Sap.new
     storeCode = params[:storeCode]
    repCode = params[:repCode]
     username = params[:username]
     password = params[:password]
     quoteNumber = params[:quoteNumber]


    params = { 'StoreCode' => "#{storeCode}", 'Password' => "#{password}",'Username' => "#{username}", 'modelName' => "UserModel", 'Platform' => "MOB", 'Version' => "1.0.7.1"}

    x = Net::HTTP.post_form(URI.parse('http://155.208.145.141/PhoneGapService/api/authentication/login'), params)

    hash = JSON.parse x.body

     @key = hash['Token']
    flash[:notice] = 'This is a test!'

    puts getQuoteParams = {'QuoteNumber'=> "#{quoteNumber}",'RepCode'=>"#{repCode}",'StoreCode'=>"#{storeCode}",'Token'=> "#{@key}",'Platform'=>"MOB",'Version'=>"1.0.7.1"}

    xy = Net::HTTP.post_form(URI.parse('http://155.208.145.141/PhoneGapService/api/quote/getquote'), getQuoteParams)
    productResult = JSON.parse(xy.body)
    puts testPass = productResult['Success']
    if testPass == "false"
      else
    puts    quoteData=  productResult["Quote"]
   #puts  hash2 = JSON.parse test
    #red
# break

#
        @address =  quoteData['CustomerAddress'].to_hash
          @deliveryAddress =  quoteData['DeliveryAddress'].to_hash
         @sapArticles =  quoteData['SapArticles']

    @projects = Project.all

    @account = Account.new
    @account.user_id = current_user.id
    @account.name = @address['Name']
    @account.phone = @address['TelNumber1']
    @account.email = @address['Email']
    @account.address =@deliveryAddress['DeliveryL1']
    @account.save

    @project = Project.new
    @project.account_id = @account.id
    @number = 299999999 + rand(100) + rand(100)
    @project.projectName = @number
    @project.version = 1
    @project.address = @deliveryAddress['DeliveryL1']
    @project.flag = 1
    @project.save
    @section = Section.new
    @section.project_id = @project.id
    @section.save
    @subsection = Subsection.new
    @subsection.section_id = @section.id
    @subsection.save
    getLenght = @sapArticles.length - 1
    (0..getLenght).each do |i|

      puts @sapArticle =  @sapArticles[i]
      puts  @sapArticle['BaseUoM']
      @sapSku = @sapArticle['ArticleCode']

      @product = Product.where(sku: @sapSku).first


      if @product.present?
        @lineItem = Lineitem.new

        @lineItem.title =  @product.title
        @lineItem.image = @product.image

        @lineItem.description = @product.description


        @lineItem.buom = @product.buom
        @lineItem.suom = @product.suom
        @lineItem.umrez = @product.umrez
        @lineItem.umren = @product.umren

        @lineItem.subdescription = @product.subdescription
        common_lineitems_info

        @lineItem.save
      else
        @lineItem = Lineitem.new

        @lineItem.title = @sapArticle['ArticleDescription']

        @lineItem.description = @sapArticle['ArticleDescription']

        @lineItem.buom = @sapArticle['BaseUoM']
        @lineItem.suom = @sapArticle['SalesUoM']
        @lineItem.umrez = @sapArticle['Umren']
        @lineItem.umren = @sapArticle['Umrez']
        common_lineitems_info
        @lineItem.save
      end
#
     end
#     @getid = @project.id
    #redirect_to :controller => 'projects',:id => 99
    #redirect_to project_path(:id => @getid)
    #respond_to do |format|
    #format.json {  redirect_to :controller => 'projects',:id => 99 }
   # @lineItems
   # @products = Product.where(:sku = );
   # @sap = Sap.new(params[:Quote])
    #puts "Logging to the rails console"
       respond_to do |format|
         format.js { render :js => "window.location.href = '/projects/#{@project.id}'" }
       end
    #end
     # respond_to do |format|
     #   format.js { render :js => "window.location.href = '/projects/#{@project.id}'" }
     # end
    #redirect_to :controller => 'data', :action => 'one'
      end #end if
    end

  private
    def common_lineitems_info
      @lineItem.sku =  @sapArticle['ArticleCode']
      @newPrice = @sapArticle['NettInvoicePriceIncVat'].to_f / @sapArticle['QtyInBaseUoM']
      @lineItem.quantity = @sapArticle['QtyInBaseUoM']

      @lineItem.price =  @newPrice
      vatprice = @sapArticle['VatAmount']
      nettprice = @sapArticle['NettInvoicePriceIncVat']
      vattotal = nettprice + vatprice
      @lineItem.exvat_price = vattotal / @sapArticle['QtyInBaseUoM']
      @lineItem.subsection_id = @subsection.id
    end
    def sap_params
      params.require(:sap).permit(:name,:username,:password,:repCode,:storeCode, :quoteNumber)
    end
end

