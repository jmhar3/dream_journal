class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    if session[:user_id]
      redirect_to daily_path
    else
      @user = User.new
      render :new
    end
  end

  def create
    if auth
      user = User.find_or_create_by(email: auth['info']['email']) do |u|
        u.username = auth['info']['name']
        u.image = auth['info']['image']
        u.password = auth['token']
      end
      on_complete user
    else
      user = User.find_by(username: params[:username])
      if user && user.authenticate(session_params[:password])
        on_complete user
      else
        flash.now[:alert] = 'Invalid username or password'
        render :new
      end
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

  private

  def auth
    request.env["omniauth.auth"]
  end

  def on_complete user
    session[:user_id] = user.id
    session[:daily_counter] = 0
    session[:monthly_counter] = 0
    redirect_to daily_path
  end

  def session_params
    params.permit(:username, :password)
  end
end