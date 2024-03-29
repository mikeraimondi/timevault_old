class TasksController < ApplicationController
  before_filter :authenticate_user!
  helper_method :get_current_time

  # GET /tasks
  # GET /tasks.json
  def index
    page_num = params[:page].to_i
    @tasks = current_user.tasks.descending_start_date.page(page_num).per(10)

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
    @commit = @task.commits.new

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
        format.html { redirect_to tasks_path, notice: 'Task was successfully updated.'}
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
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_path, notice: 'Task was successfully deleted.'}
      format.json { head :no_content }
    end
  end

  def get_current_time
    DateTime.now.strftime('%d/%m/%Y %I:%M:%S %p')
  end
end
