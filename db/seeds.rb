require 'factory_girl_rails'

user = FactoryGirl.create(:user)
user.confirmed_at = Time.now
user.save
