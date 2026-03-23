module ApplicationHelper
  def report_color(report)
    case report&.up
    when true then "bg-green-500"
    when false then "bg-red-500"
    else            "bg-gray-300"
    end
  end
end
