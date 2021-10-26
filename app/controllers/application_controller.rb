class ApplicationController < ActionController::Base
    layout "tracker"
    
    before_action :set_current_user
    before_action :require_login

    def set_current_user
      Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def require_login
        redirect_to '/sign_in' unless session.include? :user_id
    end 
end
