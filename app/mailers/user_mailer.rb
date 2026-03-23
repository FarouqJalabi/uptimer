class UserMailer < ApplicationMailer
  default from: "notifications@example.com"

  def welcome
    @user = params[:user]
    @url  = "https://uptimer.rubynor.com"
    mail(to: @user.email, subject: "Welcome to uptimer!")
  end
end
