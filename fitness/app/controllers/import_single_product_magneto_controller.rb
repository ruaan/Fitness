class ImportSingleProductMagnetoController < ApplicationController
  require 'soapApi'
  include MagentoSoapApi
  def index
  end

  def create
    modal_render("import")
  end

  def import
   @getSku = params[:sku]
  #  @getSku = "AQWHOV0003T"

       #include MagentoSoapApi
   @wsdl = "http://www.italtile.co.za/api/soap/?wsdl"
   @username = "sync"
   @password = "sync_123"

       api = MagentoSoapApi.new(@wsdl, @username, @password)


         item = api.call("catalog_product.info", { "productId" => @getSku })
   puts item
         product = Product.new
         product.title = item["name"]
         product.sku = item["sku"]

       # item["category_ids"]
         if not item["category_ids"].is_a?(Array)


          product.catagory = item["category_ids"]

          else
            if item["category_ids"].include?("130")
               product.catagory = "130"
            else

            product.catagory = item["category_ids"][0]
           end
          end
         #buom
         #19 = square meters
         #18  - items
         salesUnit = item["suom"]
         if salesUnit == "21"
           product.suom = "Boxes"
         elsif salesUnit == "22"
           product.suom = "Items"
         elsif salesUnit == "831"
           product.suom = "Sheets"
         end


         baseUnit = item["buom"]

         if baseUnit == "19"
           product.buom = "Square Meters"
         elsif baseUnit == "18"
           product.buom = "Items"
         end
         #suom
         #831 = sheets
         #22 = items
         if item["special_price"].nil?
           price = item["price"]
         else
           price = item["special_price"]
         end

         product.price = price
         product.umren = item["umren"].to_i
         product.umrez = item["umrez"].to_i

         product.exvat_price = (price.to_i * 100 / 114) # sure this should be: product.exvat_price = price.to_i / 1.14, think the calculation is incorrect, Ruaan please review
         product.description = item["description"]
         product.subdescription = item["short_description"]
         product.size = item["size"]
         product.manufacturer = item["manufacturer"]
         product.material = item["material"]
         product.color = item["color"]
         product.finish = item["finish"]


         image = api.call("product_media.list", { "productId" => @getSku })
         if image.present?
           if not image.is_a?(Array)
             product.image = image["url"]
           else
             product.image = image.first["url"]
             if (image.count > 1)
               if image.last["url"].include? "_t"
                 product.techimage = image.last["url"]
               end
               if image.last["url"].include? "_T"
                 product.techimage = image.last["url"]
               end
             end
           end
         end
         product.save


   redirect_to '/data/one'


  end
end


