class CreateAccounts < ActiveRecord::Migration
  def change
   # drop_table :accounts
    create_table :accounts do |t|
      t.integer :user_id
      t.string :name
      t.string :phone
      t.string :email
      t.string :address
      t.string :vat

      t.timestamps
    end
  end
end
