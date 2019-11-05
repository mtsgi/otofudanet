class CreateDecks < ActiveRecord::Migration[6.0]
  def change
    create_table :decks do |t|
      t.integer :user_id
      t.string :name
      t.integer :slot1
      t.integer :slot2
      t.integer :slot3
      t.integer :slot4
      t.integer :slot5
      t.timestamps
    end
  end
end
