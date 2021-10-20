module PagesHelper
    def current_date
        date = DateTime.now
        date.strftime("%A, #{date.day.ordinalize} of %B")
    end

    def current_month
        date = DateTime.now
        date.strftime("%B")
    end
end