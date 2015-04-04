class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :project_id
      t.string :name
      t.string :description
      t.string :misc

      t.timestamps
    end
  end
end
