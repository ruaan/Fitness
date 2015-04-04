json.array!(@sections) do |section|
  json.extract! section, :id, :project_id, :name, :description, :misc
  json.url section_url(section, format: :json)
end
