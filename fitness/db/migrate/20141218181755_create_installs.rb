class CreateInstalls < ActiveRecord::Migration
  def change
    create_table :installs do |t|
      t.integer :product_id
      t.string :image
      t.string :title
      t.string :sku
      t.string :category
      t.decimal :price
      t.string :quantity
      t.string :description
      t.string :subdescription
      t.decimal :exvat_price
      t.timestamps
    end
  end
end
