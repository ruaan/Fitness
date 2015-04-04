class CreateSappushes < ActiveRecord::Migration
  def change
    create_table :sappushes do |t|
      t.string :name

      t.timestamps
    end
  end
end
