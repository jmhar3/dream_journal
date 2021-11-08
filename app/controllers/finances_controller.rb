class FinancesController < ApplicationController

    def index
    end

    def new
        @finance = current_user.finances.new(date: Date.today)
    end

    def create
        @finance = current_user.finances.new(finance_params)
        if @finance.save
            redirect_to daily_path
        else
            render :new
        end
    end

    private

    def finance_params
        params.require(:finance)
        .permit(:flow, :amount, :date)
    end
end
