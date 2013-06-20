require 'spec_helper'

describe User do

  it { should allow_value("strongpassword").for(:password) }
  it { should_not allow_value("foo").for(:password) }
  it { should have_many(:tasks) }

  it { should have_many(:intervals) }

  it { should have_many(:repositories) }

  it { should have_many(:commits) }

  describe "indicates whether a pomodoro is currently running" do
    let(:user) { FactoryGirl.create(:user) }

    it "indicates that one is not running" do
      expect( user.timer_running? ).to eql(false)
    end

    it "indicates that one is running" do
      pomodoro = user.pomodoros.create(duration: 10, period: "break")
      expect( user.timer_running? ).to eql(true)
    end
  end

end
