json.array!(@products) do |product|
  json.extract! product, :id, :image, :title, :sku, :catagory, :price, :description, :subdescription
  json.url product_url(product, format: :json)
end
