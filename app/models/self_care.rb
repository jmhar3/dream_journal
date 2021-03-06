class SelfCare < ApplicationRecord
    belongs_to :user
    has_many :completed_cares

    validates :label, presence: true, length: { maximum: 20}
    validates :goal, presence: true, :inclusion => 1..8

    # after_create do
    #     CreateCompletedCareJob.perform_now(self.id)
    # end
end