class ApplicationController < ActionController::Base
    
    before_action :set_current_user
    before_action :require_login

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_login
    redirect_to '/sign_in' unless session.include? :user_id
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