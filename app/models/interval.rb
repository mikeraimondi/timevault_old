class Interval < ActiveRecord::Base
  attr_accessible :end, :start

  belongs_to :pomodoro
end
