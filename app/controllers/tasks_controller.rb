class TasksController < ApplicationController
  before_filter :authenticate_user!
  helper_method :get_current_time

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = current_user.tasks.order("start DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks}
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = current_user.tasks.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task}
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = current_user.tasks.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task}
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def edit
    @task = current_user.tasks.find(params[:id])
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = current_user.tasks.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.'}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def get_current_time
    DateTime.now.strftime('%m/%d/%Y %I:%M:%S %p')
  end
end
