class PomodorosController < ApplicationController
  before_filter :authenticate_user!

  # GET /pomodoros
  # GET /pomodoros.json
  def index
    @pomodoros = []
    current_user.pomodoros.all.each do |pomodoro|
      pom_hash = { duration: pomodoro.duration,
                  remaining: pomodoro.duration_remaining }
      @pomodoros.push pom_hash
    end
    @pomodoros

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pomodoros }
    end
  end

  # GET /pomodoros/1
  # GET /pomodoros/1.json
  def show
    @pomodoro = current_user.pomodoros.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pomodoro }
    end
  end


end
