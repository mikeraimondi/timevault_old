class Interval < ActiveRecord::Base
  attr_accessible :start, :end, :worker_id

  belongs_to  :pomodoro,
              inverse_of: :intervals
              
  validates_presence_of :pomodoro

  validates_presence_of :start

  after_create  :create_interval_worker

  def create_interval_worker
    job = Delayed::Job.enqueue(IntervalWorker.new(id), run_at: when_to_run)
    self.worker_id = job.id 
    save
  end

  def clean_up!
    if pomodoro.duration_remaining == 0
      unless self.end.present?
        self.end = DateTime.now
        if self.save
          pomodoro.send_pomodoro_notification_email!
        end
      end
    end
    destroy_worker!
  end

  def destroy_worker!
    if job = Delayed::Job.where(id: worker_id).first
      job.destroy
    end
  end

  private

  def when_to_run
    (self.pomodoro.duration).seconds.from_now
  end

end
