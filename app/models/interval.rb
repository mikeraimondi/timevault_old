class Interval < ActiveRecord::Base
  belongs_to  :pomodoro,
              inverse_of: :intervals
              
  validates_presence_of :pomodoro
  validates_presence_of :start

  after_create  :create_interval_worker

  attr_accessible :start, :end

  def create_interval_worker
    Delayed::Job.enqueue(IntervalWorker.new(id), run_at: when_to_run)
    save
  end

  def complete!
    if pomodoro.duration_remaining == 0
      unless self.end.present?
        self.end = DateTime.now
        if self.save
          pomodoro.send_pomodoro_notification_email!
        end
      end
    end
  end

  private

  def when_to_run
    (self.pomodoro.duration).seconds.from_now
  end

  class << self

    def unclosed
      where(end: nil)
    end
    
  end

end
