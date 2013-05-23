require 'spec_helper'

feature 'Signing up' do

  scenario  'Signing up with valid credentials' do
    visit '/'
    within (".hero-unit") do
      click_link 'Get Started' 
    end
    within ("#new_user") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'
    end
    page.should have_content 'Welcome! You have signed up successfully.'
  end

  scenario  'Signing up with duplicate email' do
    @user = FactoryGirl.create(:user)
    visit '/'
    within (".hero-unit") do
      click_link 'Get Started' 
    end
    within ("#new_user") do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Password confirmation', with: @user.password
      click_button 'Sign up'
    end
    page.should have_content 'Please review the problems below:'
  end

  scenario  'Signing up with invalid credentials' do
    visit '/'
    within (".hero-unit") do
      click_link 'Get Started' 
    end
    within ("#new_user") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'short'
      fill_in 'Password confirmation', with: 'short'
      click_button 'Sign up'
    end
    page.should have_content 'Please review the problems below:'
  end

end
