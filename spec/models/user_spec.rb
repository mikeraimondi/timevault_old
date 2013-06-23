require 'spec_helper'

describe User do
  it { should validate_presence_of(:role) }

  it { should allow_value("user").for(:role) }
  it { should allow_value("admin").for(:role) }
  it { should_not allow_value("foobar").for(:role) }

  it { should allow_value("strongpassword").for(:password) }
  it { should_not allow_value("foo").for(:password) }
  it { should have_many(:tasks) }

  it { should have_many(:intervals) }

  it { should have_many(:repositories) }

  it { should have_many(:commits) }

  let(:user) { FactoryGirl.create(:user) }

  describe "indicates whether a pomodoro is currently running" do

    it "indicates that one is not running" do
      expect( user.timer_running? ).to eql(false)
    end

    it "indicates that one is running" do
      pomodoro = user.pomodoros.create(duration: 10, period: "break")
      expect( user.timer_running? ).to eql(true)
    end
  end

  context "when not an admin" do
    it "does not indicate admin role" do
      expect(user.admin?).to be_false
    end
  end

  context "when admin" do
    let(:admin) { FactoryGirl.create(:admin) }

    it "indicates admin role" do
      expect(admin.admin?).to be_true
    end
  end

end
