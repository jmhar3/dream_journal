class PagesController < ApplicationController
    skip_before_action :require_login, only: [:home]
    before_action :daily, :monthly

    def home
    end

    def daily
    end

    def monthly
        @self_cares = current_user.self_cares.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).to_a
    end

    def account
        @user = User.find(session[:user_id])
        @friends = @user.friends_added
    end

    def tracker_menu
    end
    
    private

    def new_note
        @note = current_user.notes.new(date: Date.today)
    end

    def goal_params
        params.require(:goal)
        .permit(:goal, :priority, :user_id, :date)
        .with_defaults(user_id: session[:user_id])
    end
end