class GratitudesController < ApplicationController
    
    def show
        @gratitude = current_user.gratitudes.find(params[:id])
    end

    def new
        @gratitude = current_user.gratitudes.new
    end

    def create
        @gratitude = current_user.gratitudes.new(gratitude_params)
        if @gratitude.save
            redirect_to daily_path
        else
            render :new
        end
    end

    def edit
        @gratitude = current_user.gratitudes.find(params[:id])
    end

    def update
        @gratitude = current_user.gratitudes.find(params[:id])
        @gratitude.update(gratitude_params)

        redirect_to daily_path
    end

    def destroy
        @gratitude = current_user.gratitudes.find(params[:id])
        @gratitude.destroy
        redirect_to daily_path
    end

    private

    def gratitude_params
        params.require(:gratitude).permit(:user_id, :name)
        .with_defaults(user_id: session[:user_id])
    end
end
