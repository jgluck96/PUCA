class ProjectsController < ApplicationController

  def index
    @projects = Project.where(completed: "false")

    render :index
  end

  def showcase
    @projects = Project.where(completed: "true")

    render :showcase
  end

  def show
    @project = Project.find(params[:id])
    @admins = @project.administrations
    @collabs = @project.collaborations

    render :show
  end

end
