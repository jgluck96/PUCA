class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create
    # byebug
    params[:project][:tech_stack] = params[:project][:tech_stack].join(', ')
    project = Project.new(new_proj_params)
    if project.save
      Administration.create(user_id: current_user.id, project_id: project.id)
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

  def admins(project)
    admins = project.administrations
    admin_ids = admins.map { |a| a.user_id }
    admin_ids.map do |id|
      User.find(id)
    end
  end

  def collabs(project)
    collabs = project.collaborations
    collab_ids = collabs.map { |c| c.user_id }
    collab_ids.map do |id|
      User.find(id)
    end
  end

  def show
    @project = Project.find(params[:id])
    @admins = admins(@project)
    @collabs = collabs(@project)
    # @tech_stack = @project.tech_stack.split(",")

    render :show
  end



  private

  def new_proj_params
    params.require(:project).permit(:title, :category, :description, :tech_stack)
  end

  # def edit_proj_params
  #   params.require(:project).permit(:title, :category, :description, :tech_stack: [], :completed)
  # end


end
