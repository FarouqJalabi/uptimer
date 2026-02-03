class AddMonitorToReport < ActiveRecord::Migration[8.1]
  def change
    add_reference :reports, :monitor, polymorphic: true, null: false
  end
end
