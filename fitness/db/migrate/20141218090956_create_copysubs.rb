class CreateCopysubs < ActiveRecord::Migration
  def change

    create_table :copysubs do |t|
      t.integer :section_id
      t.integer :subsection_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
