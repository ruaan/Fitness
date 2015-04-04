class CreateLineitems < ActiveRecord::Migration
  def change
    create_table :lineitems do |t|
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
