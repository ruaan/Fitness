class AddUserToProjects < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.integer :user_id
    end
  end
end
