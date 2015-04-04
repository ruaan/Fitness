json.array!(@accounts) do |account|
  json.extract! account, :id, :user_id, :name, :phone, :email, :address, :vat
  json.url account_url(account, format: :json)
end
