class Goal < ApplicationRecord
    has_many :users

    scope :not_priority, -> { where(priority: false) }

    scope :priority, -> { where(priority: true) }
end