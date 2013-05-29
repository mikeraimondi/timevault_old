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
      @pomodoro = current_user.pomodoros.new(params[:pomodoro])

      if @pomodoro.save
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
