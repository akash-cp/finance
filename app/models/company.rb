class Company < ActiveRecord::Base
  has_many :users
  has_many :incomes
  has_many :expenses
  has_many :income_categories
  has_many :expense_categories
  has_many :transactions
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  validates :name, uniqueness: true
  validates :subdomain, uniqueness: true

end