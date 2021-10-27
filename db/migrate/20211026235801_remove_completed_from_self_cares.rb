class RemoveCompletedFromSelfCares < ActiveRecord::Migration[6.1]
  def change
    remove_column :self_cares, :completed, :integer
  end
end