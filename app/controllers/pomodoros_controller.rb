class PomodorosController < InheritedResources::Base
  before_filter :authenticate_user!
  respond_to :html, :json

  def index
    index! do
      setup_pomodoros
    end
  end

  def create
    create! do |format|
      @pomodoro = PomodoroMaker.new(current_user, params[:pomodoro]).make_pomodoro

      if current_user.timer_running?
        setup_pomodoros
        format.html { redirect_to pomodoros_path, alert: 'Error: pomodoro is already running' }
      elsif @pomodoro.save
        format.html { redirect_to pomodoros_path, notice: 'Pomodoro was successfully created' }
      else
        setup_pomodoros
        format.html { render action: "index" }
      end
    end
  end

  def setup_pomodoros
    @pomodoros = current_user.pomodoros.all
    @pomodoro ||= current_user.pomodoros.new
  end

end
