class CreateCopysecs < ActiveRecord::Migration
  def change

    create_table :copysecs do |t|
      t.integer :project_id
      t.integer :section_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
