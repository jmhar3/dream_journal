class FinancesController < ApplicationController

    def index
    end

    def new
        @finance = Finance.new(date: Date.today)
    end

    def create
        @finance = Finance.new(finance_params)
        if @finance.save
            redirect_to daily_path
        else
            render :new
        end
    end

    private

    def finance_params
        params.require(:finance)
        .permit(:user_id, :flow, :amount, :date)
        .with_defaults(user_id: session[:user_id])
    end
end
