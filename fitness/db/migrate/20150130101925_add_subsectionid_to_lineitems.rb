class AddSubsectionidToLineitems < ActiveRecord::Migration

    def change
      change_table :lineitems do |t|
        t.integer :subsection_id
      end
  end
end
