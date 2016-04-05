class CreateIncomeCategories < ActiveRecord::Migration
  def change
    create_table :income_categories do |t|
      t.string :name
      t.references :company, index: true, foreign_key: true
      t.integer :created_by
      t.integer :updated_by

      t.timestamps null: false
    end
  end
end
