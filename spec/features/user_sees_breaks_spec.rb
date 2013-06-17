require 'spec_helper'
include Warden::Test::Helpers

feature "User sees breaks", %Q{
  As a user
  I want to see my break periods and productive periods
  so I can remember where I am in the pomodoro cycle.
  } do

  given(:user) { FactoryGirl.create(:user) }

  background do
    Warden.test_mode!
    user.confirmed_at = Time.now
    user.save
    login_as(user, scope: :user)
    visit pomodoros_path
  end

  after :each do
    Warden.test_reset!
  end

  scenario "User sees productive period" do
    click_button "Start Pomodoro"
    expect(page).to have_css(".pomodoro-entry")
  end

  scenario "User sees break period" do
    click_button "Start Break"
    expect(page).to have_css(".break-entry")
  end

  scenario "User sees long break period" do
    click_button "Start Break"
    expect(page).to have_css(".long-break-entry")
  end

end
