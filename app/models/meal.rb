class Meal < ApplicationRecord
    belongs_to :user
    has_many :foods
    
    def food_attributes=(food)
        self.food = Food.find_or_create_by(name: Food[:name])
        self.food.update(food)
    end
end