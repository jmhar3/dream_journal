module PagesHelper
    def current_date
        daily_date.strftime("%A, #{daily_date.day.ordinalize} of %B")
    end

    def current_month
        monthly_date.strftime("%B")
    end

    def goals
        Goal.by_user(session[:user_id]).today(daily_date).not_priority.to_a
    end

    def priorities
        Goal.by_user(session[:user_id]).today(daily_date).priority.to_a
    end

    def tomorrows_goals
        Goal.by_user(session[:user_id]).tomorrow(daily_date).to_a
    end

    def monthly_goals
        Goal.by_user(session[:user_id]).monthly(monthly_date).not_priority.to_a
    end

    def monthly_priorities
        Goal.by_user(session[:user_id]).monthly(monthly_date).priority.to_a
    end

    def finance_progress
        if monthly_earnings != 0 && monthly_expenses != 0
            percentage = (monthly_expenses.to_f/monthly_earnings.to_f)*100.0
            percentage.to_i
        end
    end

    def self_care_progress goal, completed
        percentage = (completed.to_f/goal.to_f)*100.0
        percentage.to_i
    end

    def self_cares
        SelfCare.by_user(session[:user_id]).to_a
    end

    def completed_cares self_care_id
        CompletedCare.where("self_cares_id = ?", self_care_id).to_a.last
    end

    def breakfast
        Meal.by_user(session[:user_id]).today(daily_date).meals("breakfast").to_a
    end

    def lunch
        Meal.by_user(session[:user_id]).today(daily_date).meals("lunch").to_a
    end

    def dinner
        Meal.by_user(session[:user_id]).today(daily_date).meals("dinner").to_a
    end

    def snack
        Meal.by_user(session[:user_id]).today(daily_date).meals("snack").to_a
    end

    def notes
        Note.by_user(session[:user_id]).today(daily_date).to_a
    end

    def monthly_notes
        Note.by_user(session[:user_id]).monthly(monthly_date).to_a
    end

    def gratitudes
        Gratitude.by_user(session[:user_id]).today.to_a
    end

    def monthly_gratitudes
        Gratitude.by_user(session[:user_id]).datetime_monthly(monthly_datetime).to_a
    end

    # ACCOUNT

    def incoming_invites
        Invitation.incoming_invitations(session[:user_id]).pending_requests
    end

    def outgoing_invites
        Invitation.outgoing_invitations(session[:user_id]).pending_requests
    end

    def incoming_confirmed
        Invitation.incoming_invitations(session[:user_id]).confirmed_requests
    end

    def outgoing_confirmed
        Invitation.outgoing_invitations(session[:user_id]).confirmed_requests
    end
end