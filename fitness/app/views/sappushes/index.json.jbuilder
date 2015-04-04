json.array!(@sappushes) do |sappush|
  json.extract! sappush, :id, :name
  json.url sappush_url(sappush, format: :json)
end
