class AddGlobalsFavname < ActiveRecord::Migration
    def change
      change_table :globals do |t|
        t.string :favname
      end
    end
  end


