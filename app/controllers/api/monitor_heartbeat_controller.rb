class Api::MonitorHeartbeatController < Api::BaseController
  def create
    monitor = Monitor::Heartbeat.find(params[:id])

    report = monitor.reports.create! up: true, info: params

    render json: report, status: :ok
  end
end
