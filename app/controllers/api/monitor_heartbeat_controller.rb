class Api::MonitorHeartbeatController < Api::BaseController
  def create
    monitor = Monitor::Heartbeat.find_sole_by(secret: params[:secret])

    report = monitor.reports.create! up: true, info: params

    render json: report, status: :ok
  end
end
