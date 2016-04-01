class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :subdomain, unique: true, null: false
      t.integer :owner_id, index: true
      t.timestamps null: false
    end
  end
end
