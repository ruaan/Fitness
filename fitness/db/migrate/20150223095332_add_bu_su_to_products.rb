class AddBuSuToProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.string :buom
      t.string :suom

    end
  end
end
