class AddNoTaxPrice < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.decimal :exvat_price
      end
  end
end
