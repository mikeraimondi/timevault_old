class Pomodoro < ActiveRecord::Base
  attr_accessible :duration
  
  belongs_to :user
  has_many :intervals

  after_create :create_interval

  validates_presence_of :duration
  validates_presence_of :user

  private
    def create_interval
      self.intervals.create(start: DateTime.now)
    end
end
