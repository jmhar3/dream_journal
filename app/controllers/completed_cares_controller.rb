class CompletedCaresController < ApplicationController
    def update
        @completed_care = CompletedCare.find_or_create_by( self_cares_id: params[:self_cares_id])

        params[:tally] = params[:id].to_i + 1
        raise completed_cares_params.inspect

        @completed_care.update(completed_cares_params)
        
        redirect_to daily_path
    end

    private

    def completed_cares_params
        params.permit(:self_cares_id, :tally).with_defaults(tally: 0)
    end
end