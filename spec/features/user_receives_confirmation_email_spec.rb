require 'spec_helper'

feature "User receives confirmation email", %Q{
  As a user
  I want to receive a confirmation email when I sign up
  so I can verify that I've input the correct email.
  } do

  given(:email)     { 'user@example.com' }
  given(:password)  { 'password'}

  scenario "User receives email after signing up" do
    prev_deliveries = ActionMailer::Base.deliveries.count
    visit new_user_registration_path
    within ("#new_user") do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_button 'Sign up'
    end
    expect(ActionMailer::Base.deliveries.count).to eql(prev_deliveries + 1)
  end

  scenario "User receives instructions on how to confirm after signing up" do
    visit new_user_registration_path
    within ("#new_user") do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_button 'Sign up'
    end
    last_delivery = ActionMailer::Base.deliveries.last
    expect(last_delivery.to).to include(email)
    expect(last_delivery.body).to include("Confirm my account")
  end

end
