class SelfCare < ApplicationRecord
    belongs_to :user
    has_many :completed_cares

    validates :label, presence: true, length: { maximum: 20}
    validates :goal, presence: true, :inclusion => 1..8

    scope :daily, -> { where(frequency: 'day') }
    scope :weekly, -> { where(frequency: 'week') }
    scope :monthly, -> { where(frequency: 'month') }

    after_create do
        CreateCompletedCareJob.perform_now(self)
    end
end