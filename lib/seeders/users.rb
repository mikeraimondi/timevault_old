require 'factory_girl_rails'

module Seeders
  module Users
    class << self
      def seed
        User.destroy_all
        FactoryGirl.create(:user)
      end
    end
  end
end
