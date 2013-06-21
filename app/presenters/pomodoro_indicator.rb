class PomodoroIndicator

  def initialize(pomodoro)
    @pomodoro = pomodoro
  end

  #TODO Use Draper
  def bar_class
    if @pomodoro.period == "productive"
      "progress-info"
    elsif @pomodoro.period == "break"
      "progress-success"
    elsif @pomodoro.period == "long_break"
      "progress-warning"
    end
  end

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
end
