class Interval < ActiveRecord::Base
  attr_accessible :end, :start

  belongs_to  :pomodoro,
              inverse_of: :intervals
  validates_presence_of :pomodoro

  validates_presence_of :start
end
