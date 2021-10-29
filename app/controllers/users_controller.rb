class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      self.self_cares.build(label: "Drink Water", goal: 8, frequency: day, user_id: session[:user_id])
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
    redirect_to daily_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end