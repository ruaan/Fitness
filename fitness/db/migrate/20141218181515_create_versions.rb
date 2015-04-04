class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.integer :account_id
      t.integer :project_id
      t.integer :user_id
      t.string :version

      t.timestamps
    end
  end
end
