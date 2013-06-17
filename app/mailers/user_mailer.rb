class UserMailer < ActionMailer::Base
  default from: "gotimevault@gmail.com"

  def pomodoro_notification(user)
    @user = user
    @url = pomodoros_path
    mail(to: user.email, subject: "Pomodoro completed")
  end
end
