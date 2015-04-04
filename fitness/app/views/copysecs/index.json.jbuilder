json.array!(@copysecs) do |copysec|
  json.extract! copysec, :id, :project_id, :section_id, :name, :description
  json.url copysec_url(copysec, format: :json)
end
