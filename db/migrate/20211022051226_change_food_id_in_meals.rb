class ChangeFoodIdInMeals < ActiveRecord::Migration[6.1]
  def change
    rename_column :meals, :food_id, :foods
  end
end