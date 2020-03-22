class CreateIcons < ActiveRecord::Migration[6.0]
  def change
    create_table :icons do |t|
      t.string :name
      t.string :url

      t.timestamps
    end

    add_column :users, :icon_id, :integer, default: 1
  end
end
