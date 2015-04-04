#json.array!(@projects) do |project|
#  json.extract! project, :id, :account_id, :projectName, :version, :documentType, :market, :randDollar, :randPound, :address, :contactPerson, :contactNumber, :notes, :flag
#  json.url project_url(project, format: :json)
#end
json.projects @projects, partial: 'api/v1/projects/show', as: :project
json.total_count @projects.respond_to?(:total_entries) ?
                     @projects.total_entries : @projects.to_a.count