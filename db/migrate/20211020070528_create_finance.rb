class CreateFinance < ActiveRecord::Migration[6.1]
  def change
    create_table :finances do |t|
      t.integer :amount
      t.string :flow
      t.date :date, default: -> { 'CURRENT_DATE' }
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end