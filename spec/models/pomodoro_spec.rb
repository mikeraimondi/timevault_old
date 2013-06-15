require 'spec_helper'

describe Pomodoro do
  it { should belong_to(:user) }
  it { should validate_presence_of(:user) }

  it { should validate_presence_of(:duration) }

  it { should have_many(:intervals) }

  let(:user) { FactoryGirl.create(:user) }

  it "should have a worker process" do
    maker = PomodoroMaker.new(user, duration: 20)
    pomodoro = maker.make_pomodoro
    pomodoro.save!
    expect(Delayed::Job.all.count).to eql(1)
  end

  describe "worker destruction" do

  end
end
