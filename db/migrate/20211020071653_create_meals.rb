class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.string :type
      t.date :date, default: -> { 'CURRENT_DATE' }
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
