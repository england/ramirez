class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.integer :balance, null: false
      t.string :uuid, null: false

      t.timestamps

      t.index :email, unique: true
      t.index :phone, unique: true
      t.index :uuid, unique: true
    end
  end
end
