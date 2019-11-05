class CreateMusics < ActiveRecord::Migration[6.0]
  def change
    create_table :musics do |t|
      t.string :name
      t.string :artist
      t.string :image
      t.string :string
      t.string :notesdesign
      t.timestamps
    end
  end
end
