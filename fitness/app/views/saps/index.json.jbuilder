json.array!(@saps) do |sap|
  json.extract! sap, :id, :name
  json.url sap_url(sap, format: :json)
end
