class CreateMonitorHeartbeats < ActiveRecord::Migration[8.1]
  def change
    create_table :monitor_heartbeats do |t|
      # t.belongs_to :website, null: false, foreign_key: true
      t.integer :time_considered_active, null: false

      t.timestamps
    end
  end
end
