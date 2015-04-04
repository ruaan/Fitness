class CreateProducts < ActiveRecord::Migration
  def change
    #drop_table :products
    create_table :products do |t|
      t.string :image
      t.string :title
      t.string :sku
      t.string :catagory
      t.decimal :price
      t.string :description
      t.string :subdescription

      t.timestamps
    end
  end
end
