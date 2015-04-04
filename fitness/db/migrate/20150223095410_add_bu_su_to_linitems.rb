class AddBuSuToLinitems < ActiveRecord::Migration
  def change
    change_table :lineitems do |t|
      t.string :buom
      t.string :suom

    end
  end
end
