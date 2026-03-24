class Api::MonitorHeartbeatController < Api::BaseController
  def create
    secret = request.headers["Secret"]
    monitor = Monitor::Heartbeat.find_sole_by(secret: secret)

    report = monitor.reports.create! up: true, info: JSON.parse(request.body.read.presence || "{}")

    render json: report, status: :created
  end
end
