class ChangePriorityToBoolean < ActiveRecord::Migration[6.1]
  def change
    change_column :goals, :priority, :boolean
  end
end