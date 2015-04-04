class AddExvatToProjects < ActiveRecord::Migration

  def change
    change_table :projects do |t|
      t.boolean :exvat
    end
  end
end
