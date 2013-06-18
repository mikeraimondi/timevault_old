class Pomodoro < ActiveRecord::Base
  attr_accessible :duration, :period
  
  before_destroy :destroy_workers

  belongs_to :user, inverse_of: :pomodoros
  validates_presence_of :user

  has_many  :intervals, inverse_of: :pomodoro,
            dependent: :destroy

  validates_presence_of :duration, :period

  validates :duration, numericality: { only_integer: true, greater_than: 0 }   

  POMODORO_PERIODS = %w[productive break long_break]

  validates_inclusion_of :period, in: POMODORO_PERIODS

  def duration_remaining
    all_intervals_duration = 0

    self.intervals.each do |interval|
      unless interval.new_record?
        diff = 0
        if interval.end.present?
          diff = (interval.end.to_datetime - interval.start.to_datetime) * 1.days
        else
          #TODO refactor out lambda
          dist = lambda { |past, now| (past - now) * 1.days }
          diff = dist.call(DateTime.now, interval.start.to_datetime)
        end
        all_intervals_duration += diff
      end
    end

    self.duration ||= 0
    time_left = (self.duration - all_intervals_duration)
    time_left = 0 if time_left < 0

    time_left
  end

  def percent_complete
    duration_remaining / duration * 100
  end

  def pause_unpause!
    if running?
      if open_interval
        int = open_interval
        int.end = DateTime.now
        int.save
      else
        intervals.create(start: DateTime.now)
      end
    end
  end

  def period_name
    if period == "productive"
      "Pomodoro"
    elsif period == "break"
      "Break"
    elsif period == "long_break"
      "Long Break"
    else
      ""
    end
  end

  def duration_string
    time_left = duration_remaining
    Time.at(time_left).utc.strftime("%H:%M:%S")
  end

  def running?
    duration = lambda { duration_remaining > 0 } 
    result = duration.call
    result
  end

  def paused?
    running? && !(open_interval)
  end

  def destroy_workers
    intervals.each { |interval| interval.destroy_worker! }
  end 

  def send_pomodoro_notification_email!
    UserMailer.pomodoro_notification(user, self).deliver
  end

  private

  def open_interval
    intervals.each { |interval| return interval unless interval.end.present? }

    false
  end

end
