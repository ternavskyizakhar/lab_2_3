class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.string :date
      t.float :amount
      t.references :account, null: false, foreign_key: true
      t.references :receiver, null: false, foreign_key: { to_table: :accounts }

      t.timestamps
    end
  end
end
