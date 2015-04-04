class CreateGlobals < ActiveRecord::Migration
  def change
   # drop_table :globals
    create_table :globals do |t|
      t.integer :section_id
      t.string :name
      t.string :section
      t.string :subsection
      t.string :image
      t.string :title
      t.string :sku
      t.string :quantity
      t.string :name
      t.string :description
      t.string :subdecription
      t.integer :price

      t.timestamps
    end
  end
end
