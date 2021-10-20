class CreateFinance < ActiveRecord::Migration[6.1]
  def change
    create_table :finances do |t|
      t.integer :amount
      t.string :type
      t.date :date, default: -> { 'CURRENT_DATE' }

      t.timestamps
    end
  end
end