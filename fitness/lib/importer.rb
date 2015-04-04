module Importer
  class Importer

    require 'soapApi'
    include MagentoSoapApi

api = MagentoSoapApi.new(@wsdl, @username, @password)

list = api.call("catalog_product.list")
         @allsizes = api.call("catalog_product_attribute.options", { "attributeId" => 'size' })
         @allmanufacturers = api.call("catalog_product_attribute.options", { "attributeId" => 'manufacturer' })
         @allcolors = api.call("catalog_product_attribute.options", { "attributeId" => 'color' })
         @allmaterials = api.call("catalog_product_attribute.options", { "attributeId" => 'material' })
         @allranges = api.call("catalog_product_attribute.options", { "attributeId" => 'range' })
         @allfinishs = api.call("catalog_product_attribute.options", { "attributeId" => 'finish' })
test = list[1003..1200]
 list.length
    test.each do |item|

  product = Product.new

  product_id = item["product_id"]
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

 item = api.call("catalog_product.info", { "productId" => product_id })
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
      @size = item["size"]

      @allsizes[1..@allsizes.size].each do |s|
       if  s["value"] == @size
         @finalSize = s["label"]
         break
       end
      end
 # size = api.call("catalog_product_link.list", { "type" => "related", "productId" => product_id })
  product.size = @finalSize
#291
      @allmanufacturers[1..@allmanufacturers.size].each do |s|
      if  s["value"] == item["manufacturer"]
        @finalmanu = s["label"]
        break
      end
    end
  product.manufacturer = @finalmanu
      @allmaterials[1..@allmaterials.size].each do |s|
        if  s["value"] == item["material"]
          @finalmaterial = s["label"]
          break
        end
      end
  product.material = @finalmaterial
      @allcolors[1..@allcolors.size].each do |s|
        if  s["value"] == item["color"]
          @finalcolor = s["label"]
          break
        end
      end
  product.color = @finalcolor


      @allfinishs[1..@allfinishs.size].each do |s|
        if  s["value"] == item["finish"]
          @finalfinish = s["label"]
          break
        end
      end
  product.finish = @finalfinish


  image = api.call("product_media.list", { "productId" => product_id })
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

  related = api.call("catalog_product_link.list", { "type" => "related", "productId" => product_id })
  if related.present?
    if related.is_a?(Array)

      related.each do |link|
        link_product_id = link["product_id"]
        ratio = link["ratio"]
        install_lists = api.call("catalog_product.info", { "productId" => link_product_id })

        if install_lists.present?

          #if install_item.present? && install_item.is_a?(Hash) && install_item.has_key?("name") && install_item.has_key?("sku") && install_item.has_key?("price")

          install = Install.new
          install.product_id = product.id
          install.title = install_lists["name"]
          install.sku = install_lists["sku"]
          install.quantity = ratio
          price = install_lists["price"]
          install.price = price
          install.exvat_price = price.to_i - (price.to_i * 100 / 114) # sure this should be: product.exvat_price = price.to_i / 1.14, think the calculation is incorrect, Ruaan please review
          install.description = install_lists["description"]
          install.subdescription = install_lists["short_description"]
          install.save

    else
      link_product_id = link["product_id"]
      ratio = link["ratio"]
      install_lists = api.call("catalog_product.info", { "productId" => link_product_id })

      if install_lists.present?


        #if install_item.present? && install_item.is_a?(Hash) && install_item.has_key?("name") && install_item.has_key?("sku") && install_item.has_key?("price")

        install = Install.new

        install.product_id = product.id

        install.title = install_lists["name"]
        install.sku = install_lists["sku"]
        install.quantity = ratio

        price = install_lists["price"]
        install.price = price
        install.exvat_price =  (price.to_i * 100 / 114) # sure this should be: product.exvat_price = price.to_i / 1.14, think the calculation is incorrect, Ruaan please review
        install.description = install_lists["description"]
        install.subdescription = install_lists["short_description"]

        install.save
        end

      end

        #end



      end
    end
    end
 end


private
def the_main_loop
  link_product_id = link["product_id"]
  ratio = link["ratio"]


  install_lists = api.call("catalog_product.info", { "productId" => link_product_id })

  if install_lists.present?


    #if install_item.present? && install_item.is_a?(Hash) && install_item.has_key?("name") && install_item.has_key?("sku") && install_item.has_key?("price")

    install = Install.new

    install.product_id = product.id

    install.title = install_lists["name"]
    install.sku = install_lists["sku"]
    install.quantity = ratio

    price = install_lists["price"]
    install.price = price
    install.exvat_price = (price.to_i * 100 / 114) # sure this should be: product.exvat_price = price.to_i / 1.14, think the calculation is incorrect, Ruaan please review
    install.description = install_lists["description"]
    install.subdescription = install_lists["short_description"]

    install.save

  end
end
  end
 # handle_asynchronously :deliver
  end

