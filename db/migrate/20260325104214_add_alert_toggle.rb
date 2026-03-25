class AddAlertToggle < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :email_notification, :boolean, null: false, default: true
  end
end
