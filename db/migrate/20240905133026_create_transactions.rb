class CreateTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :transactions do |t|
      t.datetime :transaction_date
      t.string :description
      t.integer :amount
      t.string :currency
      t.string :direction

      t.timestamps
    end
  end
end
