class AddUserToMonitor < ActiveRecord::Migration[8.1]
  def change
    add_reference :monitor_fetches, :user, null: false, foreign_key: true
    add_reference :monitor_heartbeats, :user, null: false, foreign_key: true

    add_column :monitor_fetches, :name, :string, default: "", null: false
    add_column :monitor_heartbeats, :name, :string, default: "", null: false
  end
end
