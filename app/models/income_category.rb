class IncomeCategory < ActiveRecord::Base
  include Filterable

  belongs_to :company
  belongs_to :creater, class_name: 'User', foreign_key: :created_by
  belongs_to :updater, class_name: 'User', foreign_key: :updated_by
  has_many   :incomes

  scope :for_start_date, ->(start_date) { where('date >= ?', Date.parse(start_date)) }
  scope :for_end_date, ->(end_date) { where('date <= ?', Date.parse(end_date)) }
  scope :for_user_id, ->(user) { where(created_by: user) }
  scope :for_category_id, ->(category_id) { where(income_category_id: category_id) }

  before_destroy :check_for_income


  private
  def check_for_income
    return false if self.incomes.size > 0
  end

end
