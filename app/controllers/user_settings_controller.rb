class UserSettingsController < ApplicationController
  def toggle_alerts
    current_user.update!(email_notification: !current_user.email_notification?)
    redirect_back_or_to root_path, notice: "Alerts is " + (current_user.email_notification? ? "unmuted" : "muted")
  end
end
