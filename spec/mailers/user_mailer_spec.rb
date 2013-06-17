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

    it "contains the user's email in the body" do
      expect(email).to have_body_text(user.email)
    end

    it "has a link to the pomodoro page" do
      expect(email).to have_body_text(pomodoros_url)
    end

    it "has a descriptive subject" do
      expect(email).to have_subject("Pomodoro Complete")
    end

    it "has instructive body text" do
      expect(email).to have_body_text("Your pomodoro is complete!")
      expect(email).to have_body_text("Follow this link to start your break")
    end
  end

end
