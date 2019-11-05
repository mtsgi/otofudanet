class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.integer :music_id
      t.integer :p1_id
      t.integer :p1_difficulty
      t.integer :p1_score
      t.integer :p1_perfect
      t.integer :p1_great
      t.integer :p1_good
      t.integer :p1_bad
      t.integer :p1_miss

      t.integer :p2_id
      t.integer :p2_difficulty
      t.integer :p2_score
      t.integer :p2_perfect
      t.integer :p2_great
      t.integer :p2_good
      t.integer :p2_bad
      t.integer :p2_miss

      t.timestamps
    end
  end
end
