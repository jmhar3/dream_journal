class CompletedCaresController < ApplicationController
    def update num, id
        @self_care = SelfCare.find_or_create_by(self_cares_id: id)

        completed_cares_params[:tally] += num

        @self_care.update(completed_cares_params)
        
        redirect_to daily_path
    end

    private

    def completed_cares_params
        params.require(:completed_care)
        .permit(:self_cares_id, :tally).with_defaults(tally: 0)
    end
end