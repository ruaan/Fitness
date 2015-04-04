json.array!(@subsections) do |subsection|
  json.extract! subsection, :id, :section_id, :name, :description
  json.url subsection_url(subsection, format: :json)
end
