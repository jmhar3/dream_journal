class Gratitude < ApplicationRecord
    belongs_to :user

    validates :name, presence: true, length: { maximum: 20}

    scope :today, -> { where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day) }
end
