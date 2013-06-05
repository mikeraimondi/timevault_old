class IntervalWorker
  def initialize(interval_id)
    @interval_id = interval_id
  end

  def perform
    interval = Interval.find(@interval_id)
    interval.clean_up!
  end
end
