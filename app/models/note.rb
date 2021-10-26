class Note < ApplicationRecord
    belongs_to :user

    scope :today, -> { where(date: Date.current) }
end
