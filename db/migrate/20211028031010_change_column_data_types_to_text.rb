class ChangeColumnDataTypesToText < ActiveRecord::Migration[6.1]
  def change
    change_column :notes, :content, :text
    change_column :goals, :more_info, :text
  end
end