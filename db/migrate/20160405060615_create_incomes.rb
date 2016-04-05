class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.date :date
      t.decimal :amount, precision: 10, scale: 4
      t.string :description
      t.integer :created_by
      t.integer :updated_by
      t.references :income_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
