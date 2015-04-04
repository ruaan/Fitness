class AddVatToLineitems < ActiveRecord::Migration
  def change
    change_table :lineitems do |t|
      t.boolean :vatex
    end
  end
end
