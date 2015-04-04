class CreateCategorizations < ActiveRecord::Migration
  def change
  #  drop_table :categorizations
    create_table :categorizations do |t|
      t.integer :product_id
      t.integer :subsection_id
      t.integer :section_id
      t.integer :quantity
      t.integer :position
      t.date :created_at

      t.timestamps
    end
  end
end
