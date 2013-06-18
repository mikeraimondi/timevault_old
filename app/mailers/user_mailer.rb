class UserMailer < ActionMailer::Base
  default from: "gotimevault@gmail.com"

  def pomodoro_notification(user, pomodoro)
    @user = user
    @url = pomodoros_url
    @pomodoro = pomodoro
    mail(to: user.email, subject: "#{@pomodoro.period_name} Complete")
  end
end
