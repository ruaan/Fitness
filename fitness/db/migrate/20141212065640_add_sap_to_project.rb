class AddSapToProject < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.integer :sapCode
    end
  end
end
