module PagesHelper
    def current_date
        date = DateTime.now
        date.strftime("%A, #{date.day.ordinalize} of %B")
    end

    def current_month
        date = DateTime.now
        date.strftime("%B")
    end

    def finances
        Finance.where(user_id: session[:user_id])
    end

    def earnings
        finances.where(flow: 'incoming').sum(:amount)
    end

    def expenses
        finances.where(flow: 'outgoing').sum(:amount)
    end

    def total
        earnings - expenses
    end

    def finance_progress
        total = (expenses.to_f/earnings.to_f)*100.0
        total.to_i
    end
end