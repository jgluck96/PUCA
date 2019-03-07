class CollaborationsController < ApplicationController

  def add_collaborator
    # byebug
    if current_user.id != params[:admin_id].to_i
      Collaboration.find_or_create_by(user_id: current_user.id, project_id: params[:project_id])
      redirect_to project_path(id: params[:project_id])
    else
      flash[:errors] = "You are already the administrator of this project"
      redirect_to project_path(id: params[:project_id])
    end
  end
  def destroy
    @collaboration = Collaboration.find(params[:id])
    @proj = Project.find_by(id: @collaboration.project_id)
    @collaboration.destroy
    redirect_to project_path(@proj)
  end
end
