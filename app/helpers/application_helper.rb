module ApplicationHelper
  def last_90_days(report_statuses)
    display_reports = report_statuses.last(90)
    display_reports = Array.new(90 - display_reports.size, nil) + display_reports
  end

  def report_color(report_status)
    case report_status
    when true then "bg-green-500"
    when false then "bg-red-500"
    else            "bg-gray-300"
    end
  end
end
