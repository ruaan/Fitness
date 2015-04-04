class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit,:manage, :update, :destroy, :clone]


  # GET /products/1
  # GET /products/1.json

  # GET /products/new
  def new

    @product = Product.new
    modal_render("form")
  end

  # GET /products/1/edit
  def edit
    modal_render("addproduct")
  end


  # POST /products
  # POST /products.json
  def create
    @quantity = params[:quantity]
    @product = Product.new(product_params)
    @product.subsection_ids = params[:product][:subsection_ids]
    @lineitem = Lineitem.create(image:@product.image, title: @product.title, sku: @product.sku, catagory: @product.catagory, price: @product.price, description: @product.description, quantity: @quantity , inclvat: @product.price,subsection_id:@checkBoxs[@count], exvat_price: @product.exvat_price,umren: @product.umren,umrez: @product.umrez, buom:@product.buom, suom:@product.suom)

    save_route_back(@product)

  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    reference_set

   @product.subsection_ids = params[:product][:subsection_ids]
    puts @quantity = params[:quantity]
   
   no_price_fix
    @checkBoxs = @product.subsection_ids
    @intsallchecks = params[:install_ids]
    #exvatcalc = @price.to_i * 0.14
    #@exvat_pirce = @price.to_i - exvatcalc.to_f
    @count = 0

    clone_product_to_lineitem
    render :js => " $('#testnow').modal('hide')"


  end

  # DELETE /products/1
  # DELETE /products/1.json


  private
    def no_price_fix
      @price = params[:priceme]
      if @price.present?
        @price = @price.to_i
        else
        @price = @product.price
      end
    end
    def clone_product_to_lineitem
      @checkBoxs.each do |g|

        lineitem_create

        if params[:install_ids].present?
          lineitem_create_loop
        end
        @count = @count + 1
      end
    end
    def lineitem_create
      @lineitem = Lineitem.create(image:@product.image, title: @product.title, sku: @product.sku, catagory: @product.catagory, price: @price, description: @product.description, quantity: @quantity , inclvat: @product.price,subsection_id:@checkBoxs[@count], exvat_price: @product.exvat_price,umren: @product.umren,umrez: @product.umrez, buom:@product.buom, suom:@product.suom)

    end
    def create_extra_lineitem
      getDetail = Product.where(sku: @getSku.sku).first
      intQuantity = @getSku.quantity.to_f
      installQuantity = (@quantity.to_i * intQuantity)
      @lineitem = Lineitem.create(image:getDetail.image, title: getDetail.title, sku: getDetail.sku, catagory: getDetail.catagory, price: getDetail.price, description: getDetail.description, quantity: installQuantity.ceil, inclvat: getDetail.price, subsection_id:@checkBoxs[@count], exvat_price: getDetail.exvat_price,umren: getDetail.umren,umrez: getDetail.umrez, buom:getDetail.buom, suom:getDetail.suom)
      # @lineitem.save
    end
    def lineitem_create_loop
      @counter = 0
      (1..@intsallchecks.length).each do |b|
        @getSku = Install.where(id:@intsallchecks[@counter]).first

        create_extra_lineitem
        @counter = @counter + 1
      end
    end

    def reference_set
      @projects = Project.all
      @project = Project.new
      @installs = Install.all
      @install = Install.new
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:image, :title, :sku, :catagory, :price, :description, :subdescription, :install_ids , :quantity, :exvat_price, :buom , :suom)
    end
end
