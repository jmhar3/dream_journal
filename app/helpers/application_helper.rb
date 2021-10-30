module ApplicationHelper
    def daily_date
        Date.current + (session[:daily_counter].days)
    end

    def monthly_date
        Date.current + (session[:monthly_counter].months)
    end

    # def monthly_datetime
    #     DateTime.current.change(month: (session[:monthly_counter]))
    # end
end