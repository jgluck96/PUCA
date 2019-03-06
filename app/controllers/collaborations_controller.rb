class CollaborationsController < ApplicationController

  def add_collaborator
    Collaboration.create(user_id: current_user.id, project_id: params[:project_id])

    redirect_to project_path(id: params[:project_id])
  end

end
