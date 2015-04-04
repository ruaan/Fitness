class AddQuantityToLineitems < ActiveRecord::Migration
  def change
    change_table :lineitems do |t|
      t.integer :quantity
    end
  end
end
