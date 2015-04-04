json.array!(@installs) do |install|
  json.extract! install, :id, :image, :title, :sku, :category, :price, :quantity, :description
  json.url install_url(install, format: :json)
end
