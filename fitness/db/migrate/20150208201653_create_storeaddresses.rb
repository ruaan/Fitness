class CreateStoreaddresses < ActiveRecord::Migration
  def change
    create_table :storeaddresses do |t|
      t.string :storecode
      t.string :head
      t.string :line1
      t.string :line2
      t.string :line3
      t.string :line4
      t.string :line5
      t.string :line6

      t.timestamps
    end
  end
end
