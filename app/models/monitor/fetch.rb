class Monitor::Fetch < Monitor::Base
  validates_presence_of :poll_interval
  validates_presence_of :url
  # TODO validate url format
  # TODO normlize url
  def build_report
    return unless should_perform?
    puts "do something"
  end

  def should_perform?
    Time.current.to_i % ActiveSupport::Duration.build(poll_interval).to_i
  end
end
