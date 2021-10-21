class PagesController < ApplicationController
    skip_before_action :require_login, only: [:home]

    def home
    end

    def daily
        # @gratitude = Gratitude.find_by(created_at: Date.current).first
    end

    def monthly
        @gratitudes = Gratitude.find_by(created_at: Date.current)
    end

    def account
        @user = User.find_by(id: session[:user_id])
        @friends = @user.friends
        @invites = @user.pending_invitations
    end
end