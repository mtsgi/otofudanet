class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :nfcid, null: false
      t.string :mail
      t.boolean :registered
      t.integer :wincount
      t.string :comment

      t.boolean :slowfast
      t.integer :hispeed
      
      t.timestamps
    end
  end
end
