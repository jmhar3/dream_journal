class ApplicationController < ActionController::Base
    before_action :set_current_user
    before_action :require_login

    def set_current_user
      Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def require_user_logged_in!
      redirect_to sign_in_path, alert: 'You must be signed in' if Current.user.nil?
    end

    private

    def require_login
        redirect_to '/sign_in' unless session.include? :user_id
    end 
end
