require 'spec_helper'

feature 'Signing in' do
  background do |user|
    @user = FactoryGirl.create(:user)
  end

  scenario  'Signing in with valid credentials' do
    visit '/users/sign_in'
    within ("#new_user") do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Sign in'
    end
    page.should have_content 'Signed in successfully.'
  end

  scenario  'Signing in with invalid credentials' do
    visit '/users/sign_in'
    within ("#new_user") do
      fill_in 'Email', with: 'invalid@bar.com'
      fill_in 'Password', with: 'foobar123'
      click_button 'Sign in'
    end
    page.should have_content 'Invalid email or password.'
  end

end
