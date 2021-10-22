class RemoveMealIdFromFoods < ActiveRecord::Migration[6.1]
  def change
    remove_column :foods, :meal_id, :integer
  end
end