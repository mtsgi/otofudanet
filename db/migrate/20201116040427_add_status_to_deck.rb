class AddStatusToDeck < ActiveRecord::Migration[6.0]
  def change
    add_column :decks, :status, :integer, default: 0
  end
end
