require "faraday/follow_redirects"

class Monitor::Fetch < Monitor::Base
  validates_presence_of :poll_interval
  validates_presence_of :url
  normalizes :url, with: ->(url) { url.starts_with?("http://", "https://") ? url : url.prepend("https://") }

  def build_report
    return unless should_report?

    connection = Faraday.new(url: url) do |f|
      f.response :follow_redirects
      f.response :json
      f.options.timeout = 3 # If site runs every second, big problemo
      f.headers["Accept"] = "application/json"
    end
    response = connection.get

    info = { status_code: response.status }
    info.merge!(response.body) if response.body.is_a? Hash

    reports.create! up: response.success?, info: info
  rescue Faraday::Error => e
    reports.create!(up: false, info: { error_class: e.class, error_message: e.message })
  rescue => e # Does it ever come here? can't make it come here...
    reports.create!(up: false, info: {  error_class: e.class, error_message: e.message, message: "Something wrong with uptimer :(" })
    raise e
  end

  private
    def should_report?
      Time.current.to_i % poll_interval.to_i == 0
    end
end
