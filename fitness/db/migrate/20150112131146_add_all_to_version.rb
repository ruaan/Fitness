class AddAllToVersion < ActiveRecord::Migration
  def change
    change_table :versions do |t|
      t.boolean :all
    end
  end
end
