class Interval < ActiveRecord::Base
  attr_accessible :end, :start

  belongs_to  :pomodoro,
              inverse_of: :intervals
              
  validates_presence_of :pomodoro

  validates_presence_of :start

  after_create :delayed_cleanup

  def delayed_cleanup
    cleanup.delay({run_at: Proc.new { when_to_run } })
  end

  def cleanup
    if self.pomodoro.duration_remaining > 0
      self.end = DateTime.now
    end
  end

  def when_to_run
    (self.pomodoro.duration).seconds.from_now
  end

end
