class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
    if logged_in?
      redirect_to user_path(session[:user_id])
    else
      @user = User.new
    end
  end

  def create
    params[:user][:experience] = params[:user][:experience].join(', ')
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  # def create_project
  #   project = Project.new(new_proj_params)
  #   if project.save
  #     redirect_to project_path(project)
  #   else
  #     flash[:errors] = project.errors.full_messages
  #     redirect_to new_project_path
  #   end
  # end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password, :bio, :location, :experience)
  end

end
