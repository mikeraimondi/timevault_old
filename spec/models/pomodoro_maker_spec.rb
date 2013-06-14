require 'spec_helper'

describe PomodoroMaker do
  let(:user)     { FactoryGirl.create(:user) }
  let(:params)   { {duration: 1} }
  let(:maker)    { PomodoroMaker.new(user, params) }
  let(:pomodoro) { maker.make_pomodoro }

  context "with valid params" do

    it "returns a pomodoro" do
      expect(pomodoro).to be_an_instance_of(Pomodoro)
    end

    it "returns a valid pomodoro" do
      expect(pomodoro).to be_valid
    end

    it "returns a pomodoro with an interval" do
      expect(pomodoro.save).to be_true
      expect(pomodoro.intervals.count).to eql(1)
    end

    it "returns a pomodoro with a valid interval" do
      expect(pomodoro.intervals.first).to be_valid
    end

  end

  context "with invalid params" do

    it "returns an invalid pomodoro" do
      invalid_params = params.dup
      invalid_params[:duration] = 0
      maker = PomodoroMaker.new(user, invalid_params)
      pomodoro = maker.make_pomodoro
      expect(pomodoro).to_not be_valid
    end

  end

end
