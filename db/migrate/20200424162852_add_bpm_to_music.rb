class AddBpmToMusic < ActiveRecord::Migration[6.0]
  def change
    rename_column :musics, :string, :comment
    # 楽曲ID
    add_column :musics, :music_id, :string, unique: true
    # BPM
    add_column :musics, :bpm, :float, null: false, default: 120.0
    # 表示BPM
    add_column :musics, :dispbpm, :string, null: false, default: "120.0"
    # 楽曲テーマカラー
    add_column :musics, :color, :string
    # オフセット(ms)
    add_column :musics, :offset, :integer, null: false, default: 0
    # デモ音源位置(ms)
    add_column :musics, :demo, :integer, null: false, default: 0
    # 譜面データ
    add_column :musics, :data, :binary
  end
end
