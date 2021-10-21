class FinancesController < ApplicationController
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
        .permit(:type, :amount, :date)
        .with_defaults(date: Date.today)
    end
end
