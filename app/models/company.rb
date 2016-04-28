class Company
  include Mongoid::Document

  field :name, type: String, null: false
  field :subdomain, type: String, null: false, unique: true
  field :subdomain, type: String
  field :owner_id, type: Integer

  embeds_many :users
  embeds_many :incomes
  embeds_many :expenses
  embeds_many :income_categories
  embeds_many :expense_categories
  embeds_many :transactions
  embeds_many :roles
  embeds_many :phone_numbers
  embedded_in :owner, class_name: 'User'


  # has_many :users
  # has_many :incomes
  # has_many :expenses
  # has_many :income_categories
  # has_many :expense_categories
  # has_many :transactions
  # has_many :roles
  # has_many :phone_numbers
  # belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  validates :name, uniqueness: true
  validates :subdomain, uniqueness: true

  accepts_nested_attributes_for :phone_numbers, allow_destroy: true

end