class Monitor::Heartbeat < Monitor::Base
  validates_presence_of :time_considered_active

  def build_report
    return unless should_perform?
    puts "do something"
  end

  def should_perform?
    Time.current.to_i - reports.last.to_i > time_considered_active
  end
end

