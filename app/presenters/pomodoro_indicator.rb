class PomodoroIndicator

  #TODO Use Draper
  def initialize(pomodoro)
    @pomodoro = pomodoro
  end

  def bar_class
    if @pomodoro.period == "productive"
      "progress-info"
    elsif @pomodoro.period == "break"
      "progress-success"
    elsif @pomodoro.period == "long_break"
      "progress-warning"
    end
  end

  #TODO use hash map
  def well_class
    if @pomodoro.period == "productive"
      "productive-entry"
    elsif @pomodoro.period == "break"
      "break-entry"
    elsif @pomodoro.period == "long_break"
      "long-break-entry"
    end
  end

  def animated
    @pomodoro.paused? ? "" : "active"
  end

  def button_label
    @pomodoro.paused? ? "Resume" : "Pause"
  end

  def start_time
    time = @pomodoro.intervals.first.start
    time.localtime.strftime("%e %b %l:%M %p")
  end

  def end_time
    time = @pomodoro.intervals.last.end
    time ||= Time.now
    time.localtime.strftime("%e %b %l:%M %p")
  end
end
