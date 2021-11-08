class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
    @user = User.new(user_params)
    @user.image = params[:image]
    if @user.save
      session[:user_id] = @user.id
      @user.create_new_user_seeds
      redirect_to root_path
    else
      render "sessions/new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    
    redirect_to account_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :image, :image_cache)
  end
end