class CompletedCaresController < ApplicationController
    def update
        params[:self_cares_id] = params[:id]
        completed_care = current_user.completed_cares.find_by( self_cares_id: params[:id])

        raise completed_care.inspect

        params[:tally] = params[:tally] + completed_care[:tally]

        completed_care.update(completed_cares_params)
        
        redirect_to session[:return]
    end

    private

    def completed_cares_params
        params.permit(:self_cares_id, :tally)
    end
end