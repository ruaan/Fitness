json.array!(@soaps) do |soap|
  json.extract! soap, :id, :name
  json.url soap_url(soap, format: :json)
end
