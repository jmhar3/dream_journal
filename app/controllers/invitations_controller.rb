class InvitationsController < ApplicationController

    def new
        @invitation = Invitation.new
    end

    def create
        friend = User.find_by_username(params[:invitation][:username])
        user = User.find_by_id(session[:user_id])
        if friend == user
            flash.now[:alert] = 'You cannot add yourself'
            render :new
        elsif friend == nil
            flash.now[:alert] = 'No User Exists'
            render :new
        else
            params[:friend_id] = friend.id
            params[:user_id] = user.id
            @invitation = Invitation.new(invitation_params)
            @invitation.save
            redirect_to account_path
        end
    end

    def confirm
        @invitation = Invitation.find(params[:id])
        @invitation.update(invitation_params)
        
        redirect_to account_path
    end

    private

    def invitation_params
        params.permit(:user_id, :friend_id)
    end
end