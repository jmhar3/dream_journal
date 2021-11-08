class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :by_user, -> (user_id) { where(user_id: user_id) } 

  scope :today, -> (daily_date) { where(date: daily_date) }

  scope :tomorrow, -> (daily_date) { where(date: daily_date + 1.day) }

  scope :monthly, -> (monthly_date) { where(date: monthly_date.change(day: 1)..monthly_date.change(day: -1))
  }

  scope :datetime_monthly, -> (monthly_datetime) { where(created_at: monthly_datetime.beginning_of_month..monthly_datetime.at_end_of_month)
  }

  scope :unique_dates, -> { pluck("distinct date(date)")}

  scope :unique_datetimes, -> { pluck("distinct date(created_at)")}
end