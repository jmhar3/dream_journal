class CompletedCaresController < ApplicationController
    def update num
        @self_care = SelfCare.find(params[:id])

        completed_cares_params[:tally] += num
        
        @self_care.update(completed_cares_params)
        
        redirect_to daily_path
    end

    private

    def completed_cares_params
        params.require(:completed_care)
        .permit(:user_id, :tally, :frequency)
        .with_defaults(user_id: session[:user_id])
    end
end