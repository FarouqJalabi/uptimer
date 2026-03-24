class ReportMailer < ApplicationMailer
  def website_up
    @report = params[:report]
    @user = @report.user
    @monitor = @report.monitor

    attachments["report_info.json"] = {
      mime_type: "application/json",
      content: @report.to_json
    }

    mail(to: @user.email, subject: "Website is back up :)")
  end

  def website_down
    @report = params[:report]
    @user = @report.user
    @monitor = @report.monitor

    attachments["report_info.json"] = {
      mime_type: "application/json",
      content: @report.to_json
    }

    mail(to: @user.email, subject: "Website down :(")
  end
end
