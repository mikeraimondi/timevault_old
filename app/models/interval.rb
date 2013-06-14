class Interval < ActiveRecord::Base
  attr_accessible :end, :start

  belongs_to  :pomodoro,
              inverse_of: :intervals
              
  validates_presence_of :pomodoro

  validates_presence_of :start

  after_commit :create_interval_worker

  def create_interval_worker
    @job = Delayed::Job.enqueue(IntervalWorker.new(self.id), run_at: when_to_run)
  end

  def clean_up!
    if self.pomodoro.duration_remaining == 0
      self.end ||= DateTime.now
      self.save!
    end
    @job.destroy if @job
  end

  def when_to_run
    (self.pomodoro.duration).seconds.from_now
  end

end
