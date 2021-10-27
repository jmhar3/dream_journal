class SelfCare < ApplicationRecord
    belongs_to :user
    has_many :completed_cares
end
