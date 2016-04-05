class IncomeCategory < ActiveRecord::Base
  belongs_to :company
  belongs_to :creater, class_name: 'User', foreign_key: :created_by
  belongs_to :updater, class_name: 'User', foreign_key: :updated_by
  has_many   :incomes

  before_destroy :check_for_income


  private
  def check_for_income
    return false if self.incomes.size > 0
  end

end
