class CreateSaps < ActiveRecord::Migration
  def change
    create_table :saps do |t|
      t.string :name

      t.timestamps
    end
  end
end
