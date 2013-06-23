require 'spec_helper'

feature "User logs in as admin", %Q{
  As a user
  I want to log in as admin
  so I can manage the site
  } do

  given(:user)      { FactoryGirl.create(:user) }
  given(:admin)     {FactoryGirl.create(:admin) }

  scenario "User with valid role logs in as admin" do
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'
    click_link "Admin"
    expect(page).to have_css("h1", text: "Site administration")
  end

  scenario "User with invalid role attempts to log in as admin" do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to_not have_link("Admin")
    visit(rails_admin_path)
    expect(page).to have_content("You are not authorized to access this page")
  end
end
