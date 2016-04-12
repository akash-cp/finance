class Transaction < ActiveRecord::Base
  include Filterable

  TYPE = %w(All Income Expense)

  EXPORT_TYPE = %w(Pdf Excel)

  belongs_to :company
  belongs_to :transactionable, polymorphic: true
  self.per_page = 10

  scope :for_start_date, ->(start_date) { where('date >= ?', Date.parse(start_date)) }
  scope :for_end_date, ->(end_date) { where('date <= ?', Date.parse(end_date)) }
  scope :for_user_id, ->(user) { where(created_by: user) if user != 'All'}
  scope :for_type, ->(type) { where(transactionable_type: type) if type != 'All'}

end
