class CreateMagentos < ActiveRecord::Migration
  def change
    create_table :magentos do |t|
      t.string :refNumber

      t.timestamps
    end
  end
end
