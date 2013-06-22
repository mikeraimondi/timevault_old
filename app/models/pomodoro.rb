class Pomodoro < ActiveRecord::Base
  attr_accessible :duration, :period
  
  belongs_to :user, inverse_of: :pomodoros
  validates_presence_of :user

  has_many  :intervals,
            inverse_of: :pomodoro,
            dependent: :destroy

  validates_presence_of :duration, :period

  validates :duration, numericality: { only_integer: true, greater_than: 0 }   

  POMODORO_PERIODS = %w[productive break long_break]

  validates_inclusion_of :period, in: POMODORO_PERIODS

  def duration_remaining
    all_intervals_duration = 0

    self.intervals.find_each do |interval|
      unless interval.new_record?
        diff = 0
        if interval.end.present?
          diff = (interval.end.to_datetime - interval.start.to_datetime) * 1.days
        else
          diff = (DateTime.now - interval.start.to_datetime) * 1.days
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
        interval = open_interval
        interval.end = DateTime.now
        interval.save
      else
        intervals.create(start: DateTime.now)
      end
    end
  end

  def period_name_map
    { 
      "productive" => "Pomodoro",
      "break" => "Break",
      "long_break" => "Long Break"
    }
  end

  def period_name
    name = period_name_map[period]
    name ||= ""
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
    running? && open_interval.nil?
  end

  def send_pomodoro_notification_email!
    UserMailer.pomodoro_notification(user, self).deliver
  end

  private

  def open_interval
    intervals.unclosed.first
  end

end
