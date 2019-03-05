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

  private

  def new_proj_params
    params.require(:project).permit(:title, :category, :description, tech_stack: [])
  end

  # def edit_proj_params
  #   params.require(:project).permit(:title, :category, :description, :tech_stack: [], :completed)
  # end
end
