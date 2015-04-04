json.array!(@magentopushes) do |magentopush|
  json.extract! magentopush, :id
  json.url magentopush_url(magentopush, format: :json)
end
