class AddFoodToMeals < ActiveRecord::Migration[6.1]
  def change
    add_reference :meals, :food, null: false
  end
end