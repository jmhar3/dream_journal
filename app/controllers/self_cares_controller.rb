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

    def completed num
        @self_care = SelfCare.find(self_care_params[:id])

        completed_progress = @self_care.completed + num

        attributes = self_care_params.clone

        attributes[:completed] = completed_progress
        
        @self_care.update_attributes(attributes)
        
        redirect_to daily_path
    end
    
    def model_params
      params.require(:model).permit(:x, :y, :z)
    end

    private

    def self_care_params
        params.require(:self_care)
        .permit(:user_id, :label, :goal, :frequency, :completed)
        .with_defaults(user_id: session[:user_id], completed: 0)
    end
end