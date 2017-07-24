class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.integer :amount, null: false
      t.string :comment

      t.timestamps
    end
  end
end
