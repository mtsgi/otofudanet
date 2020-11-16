class AddStatusToDeck < ActiveRecord::Migration[6.0]
  def change
    add_column :decks, :status, :integer 
  end
end
