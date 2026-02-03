class Monitor::Fetch < Monitor::Base
  validates_presence_of :poll_interval
  validates_presence_of :url

  # TODO validate url format
  # TODO normlize url

  def build_report
    return unless should_report?
    response = Faraday.get(url)
    # NOTE 301 isn't successfull
    reports.create! up: response.success?, info: { status: response.status } # Maybe include more info if fail?
  rescue Faraday::Error, Faraday::ConnectionFailed => e
    reports.create!(up: false, info: { error: e })
  end

  private
    def should_report?
      Time.current.to_i % poll_interval.to_i == 0
    end
end
