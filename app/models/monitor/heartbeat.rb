class Monitor::Heartbeat < Monitor::Base
  validates_presence_of :time_considered_active

  validates :secret, presence: true
  has_secure_token :secret
  encrypts :secret, deterministic: true

  def build_report
    return unless should_report?

    reports.create up: false, info: { time_since_last_success: time_since_last_success }
  end

  private
    def should_report?
      if time_since_last_success && reports.last.up
        time_since_last_success > time_considered_active
      else
        # We create reports on interval not every second if last not
        Time.current.to_i % time_considered_active.to_i == 0
      end
    end

    def time_since_last_success
      last_success_report = reports.up.last

      return nil unless last_success_report

      Time.current - last_success_report.created_at
    end
end
