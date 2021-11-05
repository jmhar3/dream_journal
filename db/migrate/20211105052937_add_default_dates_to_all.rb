class AddDefaultDatesToAll < ActiveRecord::Migration[6.1]
  def change
    change_column :meals, :date, :date, default: 'CURRENT_DATE'
    change_column :notes, :date, :date, default: 'CURRENT_DATE'
  end
end
