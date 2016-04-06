class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :company, index: true, foreign_key: true
      t.integer :transactionable_id
      t.string  :transactionable_type
      t.date  :date
      t.integer  :created_by
      t.timestamps null: false
    end
  end
end
