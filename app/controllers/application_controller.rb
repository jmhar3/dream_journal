class ApplicationController < ActionController::Base
    before_action :current_user
    before_action :require_login

  def current_user
    Current.user = User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    redirect_to '/login' unless session.include? :user_id
  end 

  def dark
    cookies[:dark] = {
      value: 'dark mode on'
    }
    redirect_to account_path
  end

  def light
    cookies.delete(:dark)
    redirect_to account_path
  end
end