class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create
    project = Project.new(new_proj_params)
    if project.save
      redirect_to project_path(project)
    else
      flash[:errors] = project.errors.full_messages
      redirect_to new_project_path
    end
  end
   
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
  
  

  private

  def new_proj_params
    params.require(:project).permit(:title, :category, :description, tech_stack: [])
  end

  # def edit_proj_params
  #   params.require(:project).permit(:title, :category, :description, :tech_stack: [], :completed)
  # end


end
