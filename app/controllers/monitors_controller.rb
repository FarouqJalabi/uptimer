class MonitorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @monitor_fetches = current_user.monitor_fetches
    @monitor_heartbeats = current_user.monitor_heartbeats
  end
end
