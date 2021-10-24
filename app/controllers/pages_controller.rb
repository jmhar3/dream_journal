class PagesController < ApplicationController
    skip_before_action :require_login, only: [:home]

    def home
    end

    def daily
        @goals = Goal.find_by(date: Date.current)
        @goal = Goal.new(date: Date.today)

        @find_gratitude = Gratitude.find_by(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
        @new_gratitude = Gratitude.new

        @notes = Note.find_by(date: Date.current)
        @note = Note.new(date: Date.today)
    end

    def monthly
        @gratitudes = Gratitude.find_by(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
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