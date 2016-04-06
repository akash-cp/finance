class Transaction < ActiveRecord::Base
  TYPE = %w(All Income Expense)

  belongs_to :company
  belongs_to :transactionable, polymorphic: true
  self.per_page = 10

  scope :range, ->(start_date, end_date) { where(date: start_date..end_date) }
  scope :for_user, ->(user) { where(created_by: user) }
  scope :for_type, ->(type) { where(transactionable_type: type) }

end
