class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.string :goal
      t.text :more_info
      t.boolean :priority
      t.date :date, default: -> { 'CURRENT_DATE' }
      t.boolean :completed
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end