class AddUmrenUmrezToLinitems < ActiveRecord::Migration
  def change
    change_table :lineitems do |t|
      t.integer :umren
      t.integer :umrez
      t.string :techimage
    end
  end
end
