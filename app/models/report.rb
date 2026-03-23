class Report < ApplicationRecord
  belongs_to :monitor, polymorphic: true
  delegate :user, to: :monitor
  store_accessor :info, :status_code # Should have been called response_body

  scope :up, -> { where(up: true) }
  scope :down, -> { where(up: false) }

  after_create_commit { broadcast_render_to monitor, template: "reports/create" }

  after_create_commit :send_mail

  private
    def send_mail
      return unless monitor_status_changed?

      if up
        ReportMailer.with(report: self).website_up.deliver_now
      else
        ReportMailer.with(report: self).website_down.deliver_now
      end
    end

    def monitor_status_changed? # Wether current and last report not same
      previous_report = monitor.reports.excluding(self).last
      return false unless previous_report

      previous_report.up != up
    end
end
