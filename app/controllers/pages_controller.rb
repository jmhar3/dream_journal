class PagesController < ApplicationController
    skip_before_action :require_login, only: [:home]

    def home
    end

    def daily
        @goals = Goal.find_by(date: Date.current, user_id: session[:user_id])
        @goal = Goal.new(date: Date.today)

        @gratitudes = Gratitude.find_by(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day, user_id: session[:user_id])
        @new_gratitude = Gratitude.new

        @notes = Note.find_by(date: Date.current, user_id: session[:user_id])
        @note = Note.new(date: Date.today)
    end

    def monthly
        @goals = Goal.find_by(date: Date.current, user_id: session[:user_id])
        @goal = Goal.new(date: Date.today)

        @gratitudes = Gratitude.find_by(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day, user_id: session[:user_id])
        @new_gratitude = Gratitude.new

        @self_cares = SelfCare.find_by(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day, user_id: session[:user_id])

        @notes = Note.find_by(date: Date.current, user_id: session[:user_id])
        @note = Note.new(date: Date.today)
    end

    def account
        @user = User.find_by(id: session[:user_id])
        @friends = @user.friends
        @invites = @user.pending_invitations
    end
    
    private

    def goal_params
        params.require(:goal)
        .permit(:goal, :priority, :user_id, :date)
        .with_defaults(user_id: session[:user_id])
    end
end