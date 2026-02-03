class MonitorJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Monitor::Fetch.all.each(&:build_report)
    Monitor::Heartbeat.all.each(&:build_report)
  end
end
