class PagesController < ApplicationController
    skip_before_action :require_login, only: [:home]

    def home
        render :layout => 'application'
    end

    def daily
        @goal = Goal.new(date: Date.today)

        @gratitudes = Gratitude.by_user(session[:user_id]).where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).to_a
        @new_gratitude = Gratitude.new

        @notes = Note.by_user(session[:user_id]).where(date: Date.current).to_a
        @note = Note.new(date: Date.today)
    end

    def monthly
        @goal = Goal.new(date: Date.today)

        @gratitudes = Gratitude.by_user(session[:user_id]).where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).to_a
        @new_gratitude = Gratitude.new

        @self_cares = SelfCare.by_user(session[:user_id]).where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).to_a

        @notes = Note.by_user(session[:user_id]).where(date: Date.current).to_a
        @note = Note.new(date: Date.today)
    end

    def account
        render :layout => 'application'
        
        @user = User.find_by(id: session[:user_id])
        @friends = @user.friends
        @invites = @user.pending_invitations
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