json.array!(@globals) do |global|
  json.extract! global, :id, :section_id, :name, :section, :subsection, :image, :title, :sku, :quantity, :name, :description, :subdecription, :price
  json.url global_url(global, format: :json)
end
