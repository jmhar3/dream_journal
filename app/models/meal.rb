class Meal < ApplicationRecord
    belongs_to :user
    has_many :foods

    scope :today, -> { where(date: Date.current) }
    scope :meals, -> (type) { where(meal: type) }
    
    def food_attributes=(food)
        self.food = Food.find_or_create_by(name: Food[:name])
        self.food.update(food)
    end
end