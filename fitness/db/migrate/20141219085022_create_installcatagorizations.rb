class CreateInstallcatagorizations < ActiveRecord::Migration
  def change
    create_table :installcatagorizations do |t|
      t.integer :lineitem_id
      t.integer :install_id
      t.integer :product_id
      t.string :product_name

      t.timestamps
    end
  end
end
