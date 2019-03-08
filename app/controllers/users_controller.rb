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
    if params[:user][:experience] == nil
      flash[:errors] = ["Enter a language"]
      redirect_to new_user_path
    else
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
end

  def show
    @user = User.find(params[:id])
    @admins = Administration.where(user_id: @user.id)
    @collaborations = Collaboration.where(user_id: @user.id)
    @projects = @admins.map do |ad|
      Project.find_by(id: ad.project_id)
    end
    @collabs = @collaborations.map do |c|
      Project.find_by(id: c.project_id)
    end

    render :show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(edit_proj_params)
      redirect_to user
    else
      flash[:errors] = user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @admins = Administration.where(user_id: @user.id)
    @projects = @admins.map do |ad|
      Project.find_by(id: ad.project_id).destroy
    end
    @user.destroy
    redirect_to home_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password, :bio, :location, :experience)
  end

  def edit_proj_params
    params.require(:user).permit(:username, :first_name, :last_name, :password, :bio, :location, :experience)
  end
end
