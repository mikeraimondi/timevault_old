require "spec_helper"

describe UserMailer do

  describe "pomodoro notification email" do
    include EmailSpec::Helpers
    include EmailSpec::Matchers
    include Rails.application.routes.url_helpers

    let(:user)   { FactoryGirl.create(:user) }
    let(:email)  { UserMailer.pomodoro_notification(user) }

    it "is set to deliver to the user email" do
      expect(email).to deliver_to(user.email)
    end
  end

end
