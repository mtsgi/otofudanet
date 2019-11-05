class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :image
      t.text :description
      t.integer :month
      t.timestamps
    end
  end
end
