class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string :number
      t.references :company, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
