class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :friend_id
      t.text :message

      t.timestamps
    end
  end
end
