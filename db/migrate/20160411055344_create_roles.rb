class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :title, null: false, default: ''

      t.boolean :can_view_income, default: true
      t.boolean :can_create_income, default: true
      t.boolean :can_edit_income, default: true
      t.boolean :can_delete_income, default: true

      t.boolean :can_view_expense, default: true
      t.boolean :can_create_expense, default: true
      t.boolean :can_edit_expense, default: true
      t.boolean :can_delete_expense, default: true

      t.boolean :can_view_income_category, default: true
      t.boolean :can_create_income_category, default: true
      t.boolean :can_edit_income_category, default: true
      t.boolean :can_delete_income_category, default: true

      t.boolean :can_view_expense_category, default: true
      t.boolean :can_create_expense_category, default: true
      t.boolean :can_edit_expense_category, default: true
      t.boolean :can_delete_expense_category, default: true

      t.boolean :can_view_user, default: true
      t.boolean :can_invite_user, default: true
      t.boolean :can_edit_user, default: true
      t.boolean :can_delete_user, default: true

      t.boolean :can_view_role, default: true
      t.boolean :can_create_role, default: true
      t.boolean :can_edit_role, default: true
      t.boolean :can_delete_role, default: true

      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end

    change_table :users do |t|
      t.references :role, index: true, foreign_key: true
    end
  end
end