require 'spec_helper'

describe Pomodoro do
  it { should belong_to(:user) }
  it { should validate_presence_of(:user) }

  it { should validate_presence_of(:duration) }
  it { should validate_presence_of(:period) }

  it "should allow valid values for period" do
    Pomodoro::POMODORO_PERIODS.each do |period|
      should allow_value(period).for(:period)
    end
  end

  it "should not allow invalid values for period" do
    should_not allow_value("").for(:period)
    should_not allow_value("foo").for(:period)
    should_not allow_value(1).for(:period)
  end

  it { should have_many(:intervals) }

  let(:user) { FactoryGirl.create(:user) }

  it "should have a worker process" do
    maker = PomodoroMaker.new(user, duration: 20, period: "productive")
    pomodoro = maker.make_pomodoro
    pomodoro.save!
    expect(Delayed::Job.all.count).to eql(1)
  end

  it "should return natural words for periods" do
    maker = PomodoroMaker.new(user, duration: 20, period: "productive")
    pomodoro = maker.make_pomodoro
    expect(pomodoro.period_name).to eql("Pomodoro")
    maker = PomodoroMaker.new(user, duration: 20, period: "break")
    pomodoro = maker.make_pomodoro
    expect(pomodoro.period_name).to eql("Break")
    maker = PomodoroMaker.new(user, duration: 20, period: "long_break")
    pomodoro = maker.make_pomodoro
    expect(pomodoro.period_name).to eql("Long Break")
  end

end
