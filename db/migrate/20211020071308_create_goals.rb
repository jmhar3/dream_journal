class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.string :goal
      t.string :more_info
      t.integer :priority
      t.date :date

      t.timestamps
    end
  end
end
