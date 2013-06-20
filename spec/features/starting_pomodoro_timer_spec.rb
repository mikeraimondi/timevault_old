require 'spec_helper'
include Warden::Test::Helpers

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
    Warden.test_mode!
    login_as(user, scope: :user)
  end

  after :each do
    Warden.test_reset!
  end

  scenario "with no currently running pomodoros" do
    visit pomodoros_path
    click_button "Start Pomodoro"
    page.should have_content "Pomodoro was successfully created"
  end

  scenario "with a currently running pomodoro" do
    visit pomodoros_path
    click_button "Start Pomodoro"
    visit pomodoros_path
    expect(page).to_not have_button "Start Pomodoro"
  end

  # scenario "with an expired pomodoro" do
  #   visit pomodoros_path
  #   click_button "Start Pomodoro"
  #   sleep 2
  #   visit pomodoros_path
  #   click_button "Start Pomodoro"
  #   page.should have_content "Pomodoro was successfully created"
  # end

  # scenario "with a negative duration" do
  #   visit pomodoros_path
  #   fill_in "Duration", with: "-5"
  #   click_button "Start Pomodoro"
  #   page.should have_content "must be greater than 0"
  # end

  # scenario "with a zero duration" do
  #   visit pomodoros_path
  #   fill_in "Duration", with: "0"
  #   click_button "Start Pomodoro"
  #   page.should have_content "must be greater than 0"
  # end

end
