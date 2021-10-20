class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.string :type
      t.date :date

      t.timestamps
    end
  end
end
