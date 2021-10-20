class CreateGratitudes < ActiveRecord::Migration[6.1]
  def change
    create_table :gratitudes do |t|
      t.string :name

      t.timestamps
    end
  end
end
