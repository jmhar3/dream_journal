class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    if session[:user_id]
      redirect_to daily_path
    else
      render :new
    end
  end

  def create
    user = User.find_by(username: params[:username])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:daily_counter] = 0
      session[:monthly_counter] = 0
      redirect_to daily_path
    else
      flash.now[:alert] = 'Invalid username or password'
      render :new
    end
  end

  def up_daily
    session[:daily_counter] += 1
    redirect_to daily_path
  end

  def down_daily
    session[:daily_counter] -= 1
    redirect_to daily_path
  end

  def reset_daily
    session[:daily_counter] = 0
    redirect_to daily_path
  end

  def up_monthly
    session[:monthly_counter] += 1
    redirect_to monthly_path
  end

  def down_monthly
    session[:monthly_counter] -= 1
    redirect_to monthly_path
  end

  def reset_monthly
    session[:monthly_counter] = 0
    redirect_to monthly_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end