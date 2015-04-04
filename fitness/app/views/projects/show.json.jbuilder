#json.extract! @project, :id, :account_id, :projectName, :version, :documentType, :market, :randDollar, :randPound, :address, :contactPerson, :contactNumber, :notes, :flag, :created_at, :updated_at
project ||= @project

json.id project['id']
json.projectName project['projectName']
json.version project['version']
json.account_id project['account_id']



if project.class == ActiveRecord::Base && !project.persisted? &&
    !project.valid?
  json.errors project.errors.messages
end