class PomodoroIndicator

  def initialize(pomodoro)
    @pomodoro = pomodoro
  end

  def animated
    @pomodoro.paused? ? "" : "active"
  end

  def button_label
    @pomodoro.paused? ? "Resume" : "Pause"
  end
end
