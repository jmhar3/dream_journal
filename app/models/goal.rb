class Goal < ApplicationRecord
    has_many :users

    scope :today, -> { where(date: Date.current) }

    scope :tomorrow, -> { where(date: Date.current + 1.day) }

    scope :not_priority, -> { where(priority: false) }

    scope :priority, -> { where(priority: true) }
end