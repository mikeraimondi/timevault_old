class Pomodoro < ActiveRecord::Base
  attr_accessible :duration
  
  belongs_to :user, inverse_of: :pomodoros
  validates_presence_of :user

  has_many  :intervals, inverse_of: :pomodoro,
            dependent: :destroy

  after_create :create_interval

  validates_presence_of :duration

  validates :duration, numericality: { only_integer: true, greater_than: 0 }   

  def duration_remaining
    all_intervals_duration = 0

    self.intervals.each do |interval|
      diff = 0
      if interval.end.present?
        diff = (interval.end - interval.start) * 1.days
      else
        dist = lambda { |past, now| (past - now) * 1.days }
        diff = dist.call(DateTime.now, interval.start.to_datetime)
      end
      all_intervals_duration += diff
    end

    self.duration ||= 0
    time_left = (self.duration - all_intervals_duration)
    time_left = 0 if time_left < 0

    time_left
  end

  def duration_string
    time_left = duration_remaining
    Time.at(time_left).utc.strftime("%H:%M:%S")
  end

  def running?
    duration = lambda { duration_remaining > 0 } 
    result = duration.call
    result
    # self.intervals.each do |interval|
    #   return true unless interval.end.present?
    # end
    # false
  end

  private
    def create_interval
      self.intervals.create(start: DateTime.now)
    end
end
