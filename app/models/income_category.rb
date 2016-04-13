class IncomeCategory < ActiveRecord::Base
  include Filterable

  belongs_to :company
  belongs_to :creater, class_name: 'User', foreign_key: :created_by
  belongs_to :updater, class_name: 'User', foreign_key: :updated_by
  has_many   :incomes, dependent: :restrict_with_error

  scope :for_start_date, ->(start_date) { where('date >= ?', Date.parse(start_date)) }
  scope :for_end_date, ->(end_date) { where('date <= ?', Date.parse(end_date)) }
  scope :for_user_id, ->(user) { where(created_by: user) }
  scope :for_category_id, ->(category_id) { where(id: category_id) }

end
