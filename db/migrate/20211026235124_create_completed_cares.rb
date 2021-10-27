class CreateCompletedCares < ActiveRecord::Migration[6.1]
  def change
    create_table :completed_cares do |t|
      t.string :tally
      t.belongs_to :self_cares, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
