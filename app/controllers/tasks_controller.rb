class TasksController < ApplicationController
  before_filter :authenticate_user!

  # def get_user
  #   @user = User.find(params[:task_id])
  # end

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks =  current_user.tasks

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks}
    end
  end
end
