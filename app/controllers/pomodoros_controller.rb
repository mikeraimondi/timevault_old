class PomodorosController < InheritedResources::Base
  before_filter :authenticate_user!
  respond_to :html, :json
  actions :index, :create, :update, :destroy

  def index
    index! do |format|
      setup_pomodoros
      format.json { render json: @pomodoros }
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

  def update
    update! do |format|
      @pomodoro = current_user.pomodoros.find(params[:id])

      if @pomodoro.update_attributes(params[:pomodoro])
        @pomodoro.pause_unpause!
        format.html { redirect_to pomodoros_path, notice: 'Pomodoro was successfully updated.'}
      else
        format.html { render action: "index" }
        format.json { render json: @pomodoro.errors, status: :unprocessable_entity }
      end
    end
  end

  def setup_pomodoros
    page_num = params[:page].to_i
    @pomodoros = current_user.pomodoros.recent_first.page(page_num).per(10)
    @pomodoros = PaginatingDecorator.new(@pomodoros)
    @pomodoro ||= current_user.pomodoros.new
  end

end
