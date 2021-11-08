class SetTallyInCompletedCares < ActiveRecord::Migration[6.1]
  def change
    remove_column :completed_cares, :tally
    add_column :completed_cares, :tally, :integer, :default => 0
  end
end
