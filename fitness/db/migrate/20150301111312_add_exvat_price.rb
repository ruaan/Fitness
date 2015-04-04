class AddExvatPrice < ActiveRecord::Migration
  def change
    change_table :lineitems do |t|
      t.decimal :exvat_price
    end
  end
end
