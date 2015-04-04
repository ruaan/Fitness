class AddUmrenUrmrezTechimage < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.integer :umren
      t.integer :umrez
      t.string :techimage
      end
  end
end
