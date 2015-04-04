class AddStoreToUser < ActiveRecord::Migration
  def change
    change_table :users do |f|
      f.string :storeCode
    end
  end
end
