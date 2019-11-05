class AddColumnToMusic < ActiveRecord::Migration[6.0]
  def change
    add_column :musics, :easy, :integer
    add_column :musics, :normal, :integer
    add_column :musics, :hard, :integer

  end
end
