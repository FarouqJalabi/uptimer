class AddSecretToHeartBeatMonitors < ActiveRecord::Migration[8.1]
  def change
    add_column :monitor_heartbeats, :secret, :string, null: true

    Monitor::Heartbeat.find_each do |heartbeat|
      heartbeat.regenerate_secret
      heartbeat.save!
    end

    change_column_null :monitor_heartbeats, :secret, false
  end
end
