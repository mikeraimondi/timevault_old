class Interval < ActiveRecord::Base
  attr_accessible :end, :start

  belongs_to :pomodoro

  validates_presence_of :pomodoro

  validates_presence_of :start
end
