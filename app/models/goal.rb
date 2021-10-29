class Goal < ApplicationRecord
    has_many :users

    validates :goal, presence: true, length: { maximum: 30}

    scope :not_priority, -> { where(priority: false) }

    scope :priority, -> { where(priority: true) }
end