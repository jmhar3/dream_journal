class Meal < ApplicationRecord
    belongs_to :user
    belongs_to :foods
end