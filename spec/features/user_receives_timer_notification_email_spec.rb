require 'spec_helper'
include Warden::Test::Helpers

feature "User receives timer notification email", %Q{
  As a user
  I want to receive notification by email that my timer is completed
  so I can know that the timer is completed if I'm away from the browser
  } do

  given(:user) { FactoryGirl.create(:user) }

  background do
    Warden.test_mode!
    user.confirmed_at = Time.now
    user.save
    login_as(user, scope: :user)
    visit pomodoros_path
    click_button "Start Pomodoro"
  end

  after :each do
    Warden.test_reset!
  end

  scenario "User receives an email after the timer is completed" do
    prev_deliveries = ActionMailer::Base.deliveries.count
    Pomodoro.last.send_pomodoro_notification_email!
    expect(ActionMailer::Base.deliveries.count).to eql(prev_deliveries + 1)
  end

  scenario "User sees their email and a URL to manage their pomodoros in the email" do
    Pomodoro.last.send_pomodoro_notification_email!
    last_delivery = ActionMailer::Base.deliveries.last
    expect(last_delivery.to).to include(user.email)
    expect(last_delivery.body).to include(pomodoros_path)
  end

end
