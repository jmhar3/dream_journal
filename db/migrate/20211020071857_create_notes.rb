class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.text :content
      t.date :date, default: -> { 'CURRENT_DATE' }
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
