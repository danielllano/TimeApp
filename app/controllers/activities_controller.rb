class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @activity = Activity.new
    @activities = Activity.all
    @projects = Project.all
  end

  def create
    @projects = Project.all
    @activities = Activity.all
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

    def activity_params
      params.require(:activity).permit(:description, :project_id)
    end
end
