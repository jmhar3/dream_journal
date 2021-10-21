class PagesController < ApplicationController
    skip_before_action :require_login, only: [:home]

    def home
    end

    def daily
    end

    def monthly
    end

    def account
        @user = User.find_by(id: session[:user_id])
    end
end