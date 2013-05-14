class Pomodoro < ActiveRecord::Base
  attr_accessible :end_time, :paused, :start_time

  belongs_to :user

  validates :start_time, presence: true
end
