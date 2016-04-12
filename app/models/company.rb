class Company < ActiveRecord::Base
  has_many :users
  has_many :incomes
  has_many :expenses
  has_many :income_categories
  has_many :expense_categories
  has_many :transactions
  has_many :roles
  has_many :phone_numbers
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  validates :name, uniqueness: true
  validates :subdomain, uniqueness: true

  accepts_nested_attributes_for :phone_numbers, allow_destroy: true

end