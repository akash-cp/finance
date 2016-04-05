class ExpenseCategory < ActiveRecord::Base
  belongs_to :company
  has_many :expenses
  belongs_to :creater, class_name: 'User', foreign_key: :created_by
  belongs_to :updater, class_name: 'User', foreign_key: :updated_by

  before_destroy :check_for_expense


  private
  def check_for_expense
    return false if self.expenses.size > 0
  end


end
