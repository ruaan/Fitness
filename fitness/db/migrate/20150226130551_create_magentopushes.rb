class CreateMagentopushes < ActiveRecord::Migration
  def change
    create_table :magentopushes do |t|

      t.timestamps
    end
  end
end
