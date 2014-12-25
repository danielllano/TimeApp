class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:edit, :update, :destroy]
  
  def index
    @projects = current_user.projects
  end

  def new
    @project = current_user.projects.build
    @modal_title = "New Project"
  end
  
  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      render 'create'
    else
      render 'new'
    end
  end

  def edit
    @modal_title = "Edit Project"
  end

  def update
    if @project.update(project_params)
      render 'update'
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name)
    end

end
