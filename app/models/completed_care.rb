class CompletedCare < ApplicationRecord
    belongs_to :user
    belongs_to :self_care
end