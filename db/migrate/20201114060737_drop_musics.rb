class DropMusics < ActiveRecord::Migration[6.0]
  def up
    drop_table :musics
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
