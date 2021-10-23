class ChangeTypeInMeals < ActiveRecord::Migration[6.1]
  def change
    rename_column :meals, :type, :meal
  end
end