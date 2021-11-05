module PagesHelper
    def current_date
        daily_date.strftime("%A, #{daily_date.day.ordinalize} of %B")
    end

    def current_month
        monthly_date.strftime("%B")
    end

    def goals
        current_user.goals.today(daily_date).not_priority.to_a
    end

    def priorities
        current_user.goals.today(daily_date).priority.to_a
    end

    def tomorrows_goals
        current_user.goals.tomorrow(daily_date).to_a
    end

    def monthly_goals
        current_user.goals.monthly(monthly_date).not_priority.to_a
    end

    def monthly_priorities
        current_user.goals.monthly(monthly_date).priority.to_a
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
        current_user.self_cares.to_a
    end

    def completed_cares self_care_id
        CompletedCare.where("self_cares_id = ?", self_care_id).to_a.last
    end

    # MEALS

    def breakfast
        current_user.meals.today(daily_date).meals("breakfast").to_a
    end

    def lunch
        current_user.meals.today(daily_date).meals("lunch").to_a
    end

    def dinner
        current_user.meals.today(daily_date).meals("dinner").to_a
    end

    def snack
        current_user.meals.today(daily_date).meals("snack").to_a
    end

    # NOTES

    def notes
        current_user.notes.today(daily_date).to_a
    end

    def monthly_notes
        current_user.notes.monthly(monthly_date).to_a
    end

    # GRATITUDES

    def gratitudes
        current_user.gratitudes.today.to_a
    end

    def monthly_gratitudes
        current_user.gratitudes.datetime_monthly(monthly_datetime).to_a
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