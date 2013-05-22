class RepositoriesController < ApplicationController
  before_filter :authenticate_user!

  def index
    setup_repositories
    
    respond_to do |format|
      format.html
    end
  end

  def create
    @repository = current_user.repositories.new(params[:repository])

    respond_to do |format|
      if @repository.save
        format.html { redirect_to repositories_path, notice: 'Repository was successfully created.' }
      else
        setup_repositories
        format.html { render action: "index" }
      end
    end
  end

  def destroy
    @repository_to_be_destroyed = current_user.repositories.find(params[:id])
    @repository_to_be_destroyed.destroy

    respond_to do |format|
      format.html { redirect_to repositories_path }
    end
  end

  def setup_repositories
    @repositories = current_user.repositories.order("name")
    @repository ||= current_user.repositories.new
  end

end
