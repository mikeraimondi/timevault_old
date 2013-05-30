require 'spec_helper'
include Warden::Test::Helpers

Warden.test_mode!

feature "Starting a pomodoro timer", %Q{
  As a user
  I want to start a pomodoro timer
  So that I can track my productivity
  } do

  #Acceptance Criteria
  #
  #

  given(:user) { FactoryGirl.create(:user) }
  background do
    login_as(user, scope: :user)
  end

  scenario "with no currently running pomodoros" do
    visit pomodoros_path
    fill_in "Duration", with: "10"
    click_button "Create Pomodoro"
    page.should have_content "Pomodoro was successfully created"
  end

  scenario "with a currently running pomodoro" do
    visit pomodoros_path
    fill_in "Duration", with: "10"
    click_button "Create Pomodoro"
    visit pomodoros_path
    fill_in "Duration", with: "10"
    click_button "Create Pomodoro"
    page.should have_content "Error: pomodoro already running"
  end

  scenario "with an invalid duration" 
end
