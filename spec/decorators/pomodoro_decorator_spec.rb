require 'spec_helper'

describe PomodoroDecorator do

  let (:productive_period) { FactoryGirl.create(:pomodoro, period: "productive").decorate }
  let (:break_period) { FactoryGirl.create(:pomodoro, period: "break").decorate }
  let (:long_break_period) { FactoryGirl.create(:pomodoro, period: "long_break").decorate }

  context "with a progress bar" do
    it "returns the class corresponding with the productive period" do
      expect(productive_period.progress_bar_style).to eql("progress-info")
    end

    it "returns the class corresponding with the break period" do
      expect(break_period.progress_bar_style).to eql("progress-success")
    end

    it "returns the class corresponding with the long break period" do
      expect(long_break_period.progress_bar_style).to eql("progress-warning")
    end
  end

  context "with a containing entry" do
    it "returns the class corresponding with the productive period" do
      expect(productive_period.entry_style).to eql("productive-entry")
    end

    it "returns the class corresponding with the break period" do
      expect(break_period.entry_style).to eql("break-entry")
    end

    it "returns the class corresponding with the long break period" do
      expect(long_break_period.entry_style).to eql("long-break-entry")
    end
  end

  context "with an animated progress bar" do
    it "returns 'active' unless paused" do
      expect(productive_period.animated).to eql("active")
      productive_period.pause_unpause!
      expect(productive_period.animated).to eql("")
    end
  end

  context "with a pause/unpause button label" do
    it "returns resume or pause depending on pause state" do
      expect(productive_period.pause_btn_label).to eql("Pause")
      productive_period.pause_unpause!
      expect(productive_period.pause_btn_label).to eql("Resume")
    end
  end

  context "with a start time" do
    it "returns a formatted string of the start time" do
      time = productive_period.intervals.first.start.localtime.strftime("%e %b %l:%M %p")
      expect(productive_period.start_time).to eql(time)
    end
  end

  context "with an end time" do
    it "returns a formatted string of the end time" do
      interval = productive_period.intervals.first
      interval.end = DateTime.now
      interval.save
      time = productive_period.intervals.first.end.localtime.strftime("%e %b %l:%M %p")
      expect(productive_period.end_time).to eql(time)
    end
  end
end
