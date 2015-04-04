class ChangeCurrencyType < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      change_column :projects, :randPound, :decimal
      change_column :projects, :randDollar, :decimal
    end
  end
end
