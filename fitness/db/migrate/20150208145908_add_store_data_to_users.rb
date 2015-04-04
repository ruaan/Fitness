class AddStoreDataToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :branchCode
      t.string :fullName
    end
  end
end
