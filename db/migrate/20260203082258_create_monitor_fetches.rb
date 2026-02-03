class CreateMonitorFetches < ActiveRecord::Migration[8.1]
  def change
    create_table :monitor_fetches do |t|
      # t.belongs_to :website, null: false, foreign_key: true
      t.string :url, null: false
      t.integer :poll_interval, null: false

      t.timestamps
    end
  end
end
