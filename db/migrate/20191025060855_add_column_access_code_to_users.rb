class AddColumnAccessCodeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :public_uid, :string
    add_index  :users, :public_uid, unique: true
  end
end
