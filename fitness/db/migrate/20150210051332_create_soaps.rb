class CreateSoaps < ActiveRecord::Migration
  def change
    create_table :soaps do |t|
      t.string :name

      t.timestamps
    end
  end
end
