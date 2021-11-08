class CompletedCaresController < ApplicationController
    def update
        params[:self_cares_id] = params[:id]
        completed_care = current_user.completed_cares.find_or_create_by( self_cares_id: params[:id])

        params[:tally] = params[:tally].to_i + 1

        completed_care.update(completed_cares_params)
        
        redirect_to daily_path
    end

    private

    def completed_cares_params
        params.permit(:self_cares_id, :tally).with_defaults(tally: 0)
    end
end