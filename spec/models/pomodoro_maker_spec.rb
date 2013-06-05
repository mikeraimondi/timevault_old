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
      expect(pomodoro.intervals.count).to eql(1)
    end

    it "returns a pomodoro with a valid interval" do
      expect(pomodoro.intervals.first).to be_valid
    end

    it "returns a pomodor that hasn't been saved"

  end

  context "with invalid params" do

    it "returns false" do
      invalid_params = params.dup
      invalid_params[:duration] = 0
      maker = PomodoroMaker.new(user, invalid_params)
      expect(maker.make_pomodoro).to be_false
    end

  end

end
