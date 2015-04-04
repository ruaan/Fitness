class CreatePeriodicJobs < ActiveRecord::Migration
  def change
    create_table :periodic_jobs do |t|
      t.string :type
      t.string :job
      t.integer :interval
      t.datetime :last_run_at

      t.timestamps
    end
  end
end
