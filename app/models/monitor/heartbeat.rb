class Monitor::Heartbeat < Monitor::Base
  validates_presence_of :time_considered_active
  validates_presence_of :secret

  has_secure_token :secret
  encrypts :secret, deterministic: true

  def build_report
    return unless should_report?

    reports.create up: false, info: { time_since_success: time_since_success }
  end

  private
    def should_report?
      if reports.last&.down?
        # On interval since success
        time_since_success.to_i % time_considered_active.to_i == 0
      else
        exeeded_time_limit?
      end
    end

    def exeeded_time_limit?
      time_since_success > time_considered_active
    end

    def time_since_success
      last_success_report = reports.up.last

      Time.current - (last_success_report.created_at || created_at)
    end
end
