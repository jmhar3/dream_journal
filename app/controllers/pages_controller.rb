class PagesController < ApplicationController
    skip_before_action :require_login, only: [:home]
    before_action :daily, :monthly

    def home
    end

    def daily
        session[:return] = daily_path
    end

    def monthly
        session[:return] = monthly_path
    end

    def account
        @user = User.find(session[:user_id])
        @friends = @user.friends_added
    end

    def tracker_menu
    end
    
    private

    def goal_params
        params.require(:goal)
        .permit(:goal, :priority, :user_id, :date)
        .with_defaults(user_id: session[:user_id])
    end
end