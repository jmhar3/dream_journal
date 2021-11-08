module ApplicationHelper

    def current_user
        Current.user = User.find(session[:user_id]) if session[:user_id]
    end

    # DATES

    def daily_date
        Date.current + (session[:daily_counter].days)
    end

    def monthly_date
        if session[:monthly_counter] == nil
            Date.current
        else
            Date.current + (session[:monthly_counter].months)
        end
    end

    def tomorrows_date
        daily_date + 1.day
    end

    def monthly_datetime
        if session[:monthly_counter] == 0 || session[:monthly_counter] == nil
            DateTime.current
        else
            DateTime.current.change(month: session[:monthly_counter])
        end
    end

    # FINANCES

    def finances
        current_user.finances
    end

    def daily_earnings
        finances.monthly(daily_date).where(flow: 'incoming').sum(:amount)
    end

    def daily_expenses
        finances.monthly(daily_date).where(flow: 'outgoing').sum(:amount)
    end

    def daily_total
        daily_earnings - daily_expenses
    end

    def monthly_finances
        finances.monthly(monthly_date)
    end

    def monthly_incoming
        monthly_finances.where(flow: 'incoming')
    end

    def monthly_outgoing
        monthly_finances.where(flow: 'outgoing')
    end

    def monthly_earnings
        monthly_incoming.sum(:amount)
    end

    def monthly_expenses
        monthly_outgoing.sum(:amount)
    end

    def monthly_total
        monthly_earnings - monthly_expenses
    end
end