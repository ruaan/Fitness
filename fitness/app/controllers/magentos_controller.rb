class MagentosController < InheritedResources::Base
 require "soapApi"
 include MagentoSoapApi


    def new

    end
    def create

      @referenceNumber = params[:refNumber]

      api = MagentoSoapApi.new("http://staging.italtile.co.za/api/soap/?wsdl", "sync", "sync_123")
      quote = api.call("cart.info", { "quoteId" => @referenceNumber })
      #raise "Incorrect quote number"
      email = quote["customer_email"]
      firstname = quote["customer_firstname"]
      lastname = quote["customer_lastname"]
      items = quote["items"]

      name = ""
      if firstname.present? && lastname.present?
        name = "#{firstname} #{lastname}"
      elsif firstname.present?
        name = firstname
      elsif lastname.present?
        name = lastname
      end

      @account = Account.new
      @account.user_id = current_user.id
      @account.name = name
      @account.email = email
      @account.save
      @project = Project.new
      @project.account_id = @account.id
      @number = 299999999 + rand(100) + rand(100)
      @project.projectName = @number
      @project.version = 1

      @project.flag = 1
      @project.save
      @section = Section.new
      @section.project_id = @project.id
      @section.save
      @subsection = Subsection.new
      @subsection.section_id = @section.id
      @subsection.save

      items.each do |l|
        @products = Product.where(sku:l["sku"]).first

        puts  @lineitem = Lineitem.create(image:@products.image, title: @products.title, sku: @products.sku, catagory: @products.catagory, price: @products.price, description: @products.description, quantity: l["qty"], inclvat: @products.price, subsection_id:@subsection.id, exvat_price: @products.exvat_price, buom:@products.buom, suom:@products.suom)

      end

      api.logout

      respond_to do |format|
        format.js { render :js => "window.location.href = '/projects/#{@project.id}'" }
      end


    end


  private

    def magento_params
      params.require(:magento).permit(:refNumber)
    end
end

