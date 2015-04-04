json.array!(@copysubs) do |copysub|
  json.extract! copysub, :id, :section_id, :subsection_id, :name, :description
  json.url copysub_url(copysub, format: :json)
end
