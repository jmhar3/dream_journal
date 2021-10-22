class PagesController < ApplicationController
    skip_before_action :require_login, only: [:home]

    def home
    end

    def daily
        @goals = Goal.find_by(date: Date.current)
        @gratitude = Gratitude.find_by(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    end

    def monthly
        @gratitudes = Gratitude.find_by(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    end

    def account
        @user = User.find_by(id: session[:user_id])
        @friends = @user.friends
        @invites = @user.pending_invitations
    end
end