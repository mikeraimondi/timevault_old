class UserMailer < ActionMailer::Base
  default from: "gotimevault@gmail.com"

  def pomodoro_notification(user)
    @user = user
    @url = pomodoros_url
    mail(to: user.email, subject: "Pomodoro Complete")
  end
end
