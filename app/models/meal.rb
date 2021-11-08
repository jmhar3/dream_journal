class Meal < ApplicationRecord
    belongs_to :user
    belongs_to :food

    scope :meals, -> (type) { where(meal_type: type) }
    
    def food_attributes=(food)
        self.food = Food.find_by(name: food[:name]) || Food.create(food)
    end
end