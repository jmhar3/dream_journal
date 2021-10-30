class SelfCaresController < ApplicationController

    def new
        @self_care = SelfCare.new
    end

    def create
        @self_care = SelfCare.new(self_care_params)
        if @self_care.save
            redirect_to daily_path
        else
            render :new
        end
    end

    def edit
        @self_care = SelfCare.find(params[:id])
    end

    def update
        @self_care = SelfCare.find(params[:id])
        @self_care.update(self_care_params)
        
        redirect_to daily_path
    end

    def destroy
        @self_care = SelfCare.find(params[:id])
        @self_care.destroy
        redirect_to daily_path
    end

    private

    def self_care_params
        params.require(:self_care)
        .permit(:user_id, :label, :goal, :frequency)
        .with_defaults(user_id: session[:user_id])
    end
end