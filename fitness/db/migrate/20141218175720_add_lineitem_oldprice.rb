class AddLineitemOldprice < ActiveRecord::Migration
  def change
    change_table :lineitems do |t|
      t.integer :inclvat
    end
  end
end
