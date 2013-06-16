class Interval < ActiveRecord::Base
  attr_accessible :start, :end

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
    if self.pomodoro.duration_remaining == 0
      unless self.end.present?
        self.end = DateTime.now
        self.save
      end
    end
    destroy_worker!
  end

  def destroy_worker!
    begin
      Delayed::Job.find(worker_id).destroy
    rescue ActiveRecord::RecordNotFound
    end
  end

  private

  def when_to_run
    (self.pomodoro.duration).seconds.from_now
  end

end
