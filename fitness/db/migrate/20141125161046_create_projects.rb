class CreateProjects < ActiveRecord::Migration
  def change

    create_table :projects do |t|
      t.integer :account_id
      t.string :projectName
      t.string :version
      t.string :documentType
      t.string :market
      t.integer :randDollar
      t.integer :randPound
      t.string :address
      t.string :contactPerson
      t.string :contactNumber
      t.string :notes
      t.integer :flag
      t.string :steps

      t.timestamps
    end
  end
end
