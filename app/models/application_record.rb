class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :by_user, -> (user_id) { where(user_id: user_id) } 

  scope :today, -> { where(date: Date.current) }

  scope :tomorrow, -> { where(date: Date.current + 1.day) }

  scope :monthly, -> { where(date: Date.current.change(day: 1)..Date.current.change(day: -1))
  }
end