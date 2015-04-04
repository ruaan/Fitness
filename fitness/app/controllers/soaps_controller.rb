class SoapsController < ApplicationController
  before_action :set_soap, only: [:show, :edit, :update, :destroy]



  # GET /soaps
  # GET /soaps.json
  def index
    @soaps = Soap.all
    #Product.destroy_all
    #Install.destroy_all
    require 'importer'
    #include Importer

    #logging out
    #api.logout

  end


  private
  def product_save_soap_loop

    @product = Product.new
    # @rawcategory = MultiJson.load(@access_token.get("/api/rest/products/#{@break['entity_id']}/categories").body)
    puts @rawcategory
    @product.image = @break['image_url']
    @product.title = @break['name']
    @product.sku = @break['sku']
    @product.catagory = catName
    @product.price = @break['regular_price_with_tax']
    @product.exvat_price = @break['regular_price_without_tax']
    @product.description = @break['description']
    @product.subdescription = @break['short_description']
    @product.save

  end

  def soap_params
    params.require(:soap).permit(:name,:email)
  end
end