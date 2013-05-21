class Pomodoro < ActiveRecord::Base
  attr_accessible :duration
  
  belongs_to :user, inverse_of: :pomodoros
  validates_presence_of :user

  has_many  :intervals, inverse_of: :pomodoro,
            dependent: :destroy

  after_create :create_interval

  validates_presence_of :duration

  private
    def create_interval
      self.intervals.create(start: DateTime.now)
    end
end
