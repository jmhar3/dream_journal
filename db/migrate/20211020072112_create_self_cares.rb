class CreateSelfCares < ActiveRecord::Migration[6.1]
  def change
    create_table :self_cares do |t|
      t.string :label
      t.integer :goal
      t.string :frequency
      t.integer :completed

      t.timestamps
    end
  end
end
