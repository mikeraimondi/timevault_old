class PomodoroMaker
  attr_reader :pomodoro

  def initialize(user, params)
    @params = params
    @user = user
  end

  def make_pomodoro
    @pomodoro = @user.pomodoros.new(@params)
    @pomodoro.intervals.build(start: DateTime.now)

    @pomodoro
  end

end
