module PagesHelper
    def current_date
        date = DateTime.now
        date.strftime("%A, #{date.day.ordinalize} of %B")
    end

    def current_month
        date = DateTime.now
        date.strftime("%B")
    end

    def goals
        Goal.by_user(session[:user_id]).today.not_priority.to_a
    end

    def priorities
        Goal.by_user(session[:user_id]).today.priority.to_a
    end

    def tomorrows_goals
        Goal.by_user(session[:user_id]).tomorrow.to_a
    end

    def monthly_goals
        Goal.by_user(session[:user_id]).monthly.priority.to_a
    end

    def monthly_priorities
        Goal.by_user(session[:user_id]).monthly.not_priority.to_a
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

    def self_care_progress goal, completed
        percentage = (completed.to_f/goal.to_f)*100.0
        percentage.to_i
    end

    def breakfast
        Meal.by_user(session[:user_id]).today.meals("breakfast").to_a
    end

    def lunch
        Meal.by_user(session[:user_id]).today.meals("lunch").to_a
    end

    def dinner
        Meal.by_user(session[:user_id]).today.meals("dinner").to_a
    end

    def snack
        Meal.by_user(session[:user_id]).today.meals("snack").to_a
    end

    def notes
        Note.by_user(session[:user_id]).today.to_a
    end

    def gratitudes
        Gratitude.by_user(session[:user_id]).today.to_a
    end

    def monthly_gratitudes
        Gratitude.by_user(session[:user_id]).datetime_monthly.to_a
    end

    def self_cares
        SelfCare.by_user(session[:user_id]).to_a
    end
end