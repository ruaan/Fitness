class CreateLineitemscatagorizations < ActiveRecord::Migration
  def change
    create_table :lineitemscatagorizations do |t|
      t.integer :lineitem_id
      t.integer :subsection_id
      t.integer :quantity
      t.integer :position

      t.timestamps
    end
  end
end
