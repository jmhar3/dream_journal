class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :by_user, ->(user_id) { where(user_id: user_id) } 

  scope :today, -> { where(date: Date.current) }

  scope :tomorrow, -> { where(date: Date.current + 1.day) }
end