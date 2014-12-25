class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_activities, only: [:index, :create]
  before_action :set_projects, only: [:index, :create]
  
  def index    
    if Activity.last.ended_at.nil?
      @activity_in_progress = true
      @activity = Activity.last
    else
      @activity_in_progress = false
      @activity = Activity.new
    end
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.started_at = Time.now
    @activity.save
    @activity_in_progress = true
    render 'index'
  end

  def update
    @activity = Activity.last
    @activity.ended_at = Time.now
    @activity.save
    @activity_in_progress = false
    redirect_to activities_path
  end

  private

    def set_activities
      @activities = Activity.joins(:project).where(projects: {user_id: current_user.id})
    end

    def set_projects
      @projects = current_user.projects
    end

    def activity_params
      params.require(:activity).permit(:description, :project_id)
    end
end
