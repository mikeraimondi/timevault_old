class Pomodoro < ActiveRecord::Base
  belongs_to :user

  has_many :intervals, :dependent => :destroy

  after_create :create_interval

  private
    def create_interval
      self.intervals.create(start: DateTime.now)
    end
end
