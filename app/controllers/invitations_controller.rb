class InvitationsController < ApplicationController

    def new
        @invitation = Invitation.new
    end

    def create
        friend = User.find_by(username: params[:username])
        user = User.find_by(id: session[:user_id])
        if friend != nil && friend != user
            @invitation = Invitation.new(friend_id: friend.id)
            @invitation.save
            redirect_to account_path
        elsif friend == user
            flash.now[:alert] = 'You cannot add yourself'
            render :new
        elsif friend == nil
            flash.now[:alert] = 'No User Exists'
            render :new
        end
    end

    private

    def invitation_params
        params.require(:invitation).permit(:user_id, :friend_id)
    end
end