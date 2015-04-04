class AddUserTraining < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :training_mode
    end
  end
end
