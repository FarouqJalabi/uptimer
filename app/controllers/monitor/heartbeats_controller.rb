class Monitor::HeartbeatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_monitor_heartbeat, only: %i[ show edit update destroy ]

  # GET /monitor/heartbeats
  def index
    @monitor_heartbeats = current_user.monitor_heartbeats
  end

  # GET /monitor/heartbeats/1
  def show
  end

  # GET /monitor/heartbeats/new
  def new
    @monitor_heartbeat = Monitor::Heartbeat.new
  end

  # GET /monitor/heartbeats/1/edit
  def edit
  end

  # POST /monitor/heartbeats
  def create
    @monitor_heartbeat = current_user.monitor_heartbeats.new(monitor_heartbeat_params)

    if @monitor_heartbeat.save
      redirect_to monitors_path, notice: "Heartbeat was successfully created."
    else
      render turbo_stream: turbo_stream.replace(
        "new_monitor_heartbeat",
        partial: "monitor/heartbeats/form",
        locals: { monitor_heartbeat: @monitor_heartbeat }
      )
    end
  end

  # PATCH/PUT /monitor/heartbeats/1
  def update
    if @monitor_heartbeat.update(monitor_heartbeat_params)
      redirect_to @monitor_heartbeat, notice: "Heartbeat was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /monitor/heartbeats/1
  def destroy
    @monitor_heartbeat.destroy!
    redirect_to monitors_path, notice: "Heartbeat was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monitor_heartbeat
      @monitor_heartbeat = current_user.monitor_heartbeats.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def monitor_heartbeat_params
      params.require(:monitor_heartbeat).permit(:name, :time_considered_active)
    end
end
