class AddValuesToProductsSearch < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.string :size
      t.string :manufacturer
      t.string :color
      t.string :sapDe
      t.string :material
      t.string :range
      t.string :finish
    end
  end
end
