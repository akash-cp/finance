# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160411055344) do

  create_table "companies", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "subdomain",  limit: 255, null: false
    t.integer  "owner_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "companies", ["owner_id"], name: "index_companies_on_owner_id", using: :btree

  create_table "expense_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "company_id", limit: 4
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "expense_categories", ["company_id"], name: "index_expense_categories_on_company_id", using: :btree

  create_table "expenses", force: :cascade do |t|
    t.date     "date"
    t.decimal  "amount",                          precision: 10, scale: 4
    t.string   "description",         limit: 255
    t.integer  "created_by",          limit: 4
    t.integer  "updated_by",          limit: 4
    t.integer  "expense_category_id", limit: 4
    t.integer  "company_id",          limit: 4
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "attachment",          limit: 255
  end

  add_index "expenses", ["company_id"], name: "index_expenses_on_company_id", using: :btree
  add_index "expenses", ["expense_category_id"], name: "index_expenses_on_expense_category_id", using: :btree

  create_table "income_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "company_id", limit: 4
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "income_categories", ["company_id"], name: "index_income_categories_on_company_id", using: :btree

  create_table "incomes", force: :cascade do |t|
    t.date     "date"
    t.decimal  "amount",                         precision: 10, scale: 4
    t.string   "description",        limit: 255
    t.integer  "created_by",         limit: 4
    t.integer  "updated_by",         limit: 4
    t.integer  "income_category_id", limit: 4
    t.integer  "company_id",         limit: 4
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.string   "attachment",         limit: 255
  end

  add_index "incomes", ["company_id"], name: "index_incomes_on_company_id", using: :btree
  add_index "incomes", ["income_category_id"], name: "index_incomes_on_income_category_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "title",                       limit: 255, default: "",   null: false
    t.boolean  "can_view_income",                         default: true
    t.boolean  "can_create_income",                       default: true
    t.boolean  "can_edit_income",                         default: true
    t.boolean  "can_delete_income",                       default: true
    t.boolean  "can_view_expense",                        default: true
    t.boolean  "can_create_expense",                      default: true
    t.boolean  "can_edit_expense",                        default: true
    t.boolean  "can_delete_expense",                      default: true
    t.boolean  "can_view_income_category",                default: true
    t.boolean  "can_create_income_category",              default: true
    t.boolean  "can_edit_income_category",                default: true
    t.boolean  "can_delete_income_category",              default: true
    t.boolean  "can_view_expense_category",               default: true
    t.boolean  "can_create_expense_category",             default: true
    t.boolean  "can_edit_expense_category",               default: true
    t.boolean  "can_delete_expense_category",             default: true
    t.boolean  "can_view_user",                           default: true
    t.boolean  "can_invite_user",                         default: true
    t.boolean  "can_edit_user",                           default: true
    t.boolean  "can_delete_user",                         default: true
    t.boolean  "can_view_role",                           default: true
    t.boolean  "can_create_role",                         default: true
    t.boolean  "can_edit_role",                           default: true
    t.boolean  "can_delete_role",                         default: true
    t.integer  "company_id",                  limit: 4
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  add_index "roles", ["company_id"], name: "index_roles_on_company_id", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.integer  "company_id",           limit: 4
    t.integer  "transactionable_id",   limit: 4
    t.string   "transactionable_type", limit: 255
    t.date     "date"
    t.integer  "created_by",           limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "transactions", ["company_id"], name: "index_transactions_on_company_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255,              null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "company_id",             limit: 4
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "avatar",                 limit: 255
    t.string   "invitation_token",       limit: 255
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit",       limit: 4
    t.integer  "invited_by_id",          limit: 4
    t.string   "invited_by_type",        limit: 255
    t.integer  "invitations_count",      limit: 4,   default: 0
    t.integer  "role_id",                limit: 4
  end

  add_index "users", ["company_id"], name: "fk_rails_7682a3bdfe", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "expense_categories", "companies"
  add_foreign_key "expenses", "companies"
  add_foreign_key "expenses", "expense_categories"
  add_foreign_key "income_categories", "companies"
  add_foreign_key "incomes", "companies"
  add_foreign_key "incomes", "income_categories"
  add_foreign_key "roles", "companies"
  add_foreign_key "transactions", "companies"
  add_foreign_key "users", "companies"
  add_foreign_key "users", "roles"
end
