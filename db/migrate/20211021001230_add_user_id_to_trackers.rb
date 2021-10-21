class AddUserIdToTrackers < ActiveRecord::Migration[6.1]
  def change
    add_column :finances, :user_id, :integer
    add_column :meals, :user_id, :integer
    add_column :goals, :user_id, :integer
    add_column :notes, :user_id, :integer
    add_column :gratitudes, :user_id, :integer
    add_column :foods, :user_id, :integer
    add_column :self_cares, :user_id, :integer
  end
end
