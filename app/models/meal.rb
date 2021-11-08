class Meal < ApplicationRecord
    belongs_to :user
    has_one :food

    scope :meals, -> (type) { where(type: type) }
    
    def food_attributes=(food)
        self.food = Food.find_or_create_by(name: food[:name])
        self.food.update(food)
    end
end