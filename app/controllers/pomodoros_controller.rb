class PomodorosController < ApplicationController
  before_filter :authenticate_user!

  # GET /pomodoros
  # GET /pomodoros.json
  def index
    @pomodoros = current_user.pomodoros.all

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

  # GET /pomodoros/new
  # GET /pomodoros/new.json
  def new
    @pomodoro = current_user.pomodoros.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pomodoro }
    end
  end

  # GET /pomodoros/1/edit
  def edit
    @pomodoro = current_user.pomodoros.find(params[:id])
  end

  # POST /pomodoros
  # POST /pomodoros.json
  def create
    @pomodoro = current_user.pomodoros.new(params[:pomodoro])

    respond_to do |format|
      if @pomodoro.save
        format.html { redirect_to @pomodoro, notice: 'Pomodoro was successfully created.' }
        format.json { render json: @pomodoro, status: :created, location: @pomodoro }
      else
        format.html { render action: "new" }
        format.json { render json: @pomodoro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pomodoros/1
  # PUT /pomodoros/1.json
  def update
    @pomodoro = current_user.pomodoros.find(params[:id])

    respond_to do |format|
      if @pomodoro.update_attributes(params[:pomodoro])
        format.html { redirect_to @pomodoro, notice: 'Pomodoro was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pomodoro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pomodoros/1
  # DELETE /pomodoros/1.json
  def destroy
    @pomodoro = current_user.pomodoros.find(params[:id])
    @pomodoro.destroy

    respond_to do |format|
      format.html { redirect_to pomodoros_url }
      format.json { head :no_content }
    end
  end
end