class AddFoodIdToMeals < ActiveRecord::Migration[6.1]
  def change
    add_column :meals, :food_id, :integer
  end
end
