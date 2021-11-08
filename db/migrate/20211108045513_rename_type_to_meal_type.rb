class RenameTypeToMealType < ActiveRecord::Migration[6.1]
  def change
    remove_column :meals, :type
    add_column :meals, :meal_type, :string
  end
end
