class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]

    def new
    end

    def create
      user = User.find_by(username: params[:username])
      if user.present? && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to daily_path
      else
        flash.now[:alert] = 'Invalid username or password'
        render :new
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_path
    end
end