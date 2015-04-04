class AddCatagoryToGlobal < ActiveRecord::Migration

    def change
      change_table :globals do |t|
        t.string :catagory
        end
    end
end
