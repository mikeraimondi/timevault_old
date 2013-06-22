class IntervalWorker
  def initialize(interval_id)
    @interval_id = interval_id
  end

  def perform
    interval = Interval.where(id: @interval_id).first
    interval.complete! if interval.present?
  end
end
