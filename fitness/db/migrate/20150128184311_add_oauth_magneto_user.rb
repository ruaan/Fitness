class AddOauthMagnetoUser < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.integer :magento_id
      t.string :magento_token
      t.string :magento_secret
    end
  end
end
