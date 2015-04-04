json.array!(@magentos) do |magento|
  json.extract! magento, :id, :refNumber
  json.url magento_url(magento, format: :json)
end
