class PomodoroDecorator < Draper::Decorator
  delegate_all

  def progress_bar_style_map
    {
      "productive" => "progress-info",
      "break" => "progress-success",
      "long_break" => "progress-warning"
    }
  end

  def progress_bar_style
    progress_bar_style_map[model.period]
  end

  def entry_style_map
    {
      "productive" => "productive-entry",
      "break" => "break-entry",
      "long_break" => "long-break-entry"
    }
  end

  def entry_style
    entry_style_map[model.period]
  end

  def animated
    model.paused? ? "" : "active"
  end

  def pause_btn_label
    model.paused? ? "Resume" : "Pause"
  end

  def start_time
    time = model.intervals.first.start
    time.localtime.strftime("%e %b %l:%M %p")
  end

  def end_time
    time = model.intervals.last.end
    time ||= Time.now
    time.localtime.strftime("%e %b %l:%M %p")
  end

end
