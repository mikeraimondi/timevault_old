class Interval < ActiveRecord::Base
  attr_accessible :end, :start

  belongs_to :pomodoro

  validates :start, presence: true
end
