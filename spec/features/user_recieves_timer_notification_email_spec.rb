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
  end

  after :each do
    Warden.test_reset!
  end

  scenario "An email is sent after the timer is completed" do
    visit pomodoros_path
    click_button "Start Pomodoro"
    prev_deliveries = ActionMailer::Base.deliveries.count
    Interval.last.clean_up!
    expect(ActionMailer::Base.deliveries.count).to eql(prev_deliveries + 1)
  end
  
end
