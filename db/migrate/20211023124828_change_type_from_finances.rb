class ChangeTypeFromFinances < ActiveRecord::Migration[6.1]
  def change
    rename_column :finances, :type, :flow
  end
end