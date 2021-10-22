class GratitudesController < ApplicationController
    def new
        @gratitude = Gratitude.new
    end

    def create
        @gratitude = Gratitude.new(gratitude_params)
        if @gratitude.save
            redirect_to daily_path
        else
            render :new
        end
    end

    def edit
        @gratitude = Gratitude.find(gratitude_params[:id])
    end

    def update
        @gratitude = Gratitude.find(gratitude_params[:id])
        @gratitude.update(gratitude_params)

        redirect_to daily_path
    end

    private

    def gratitude_params
        params.require(:gratitude).permit(:user_id, :name)
        .with_defaults(user_id: session[:user_id])
    end
end
