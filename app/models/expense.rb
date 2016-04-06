class Expense < ActiveRecord::Base
  belongs_to :expense_category
  belongs_to :creater, class_name: 'User', foreign_key: :created_by
  belongs_to :updater, class_name: 'User', foreign_key: :updated_by
  has_one :feed, as: :transactionable, class_name: 'Transaction'
  mount_uploader :attachment, AttachmentUploader

  before_create :create_transaction

  scope :range, ->(start_date, end_date) { where(date: start_date..end_date) }
  scope :for_user, ->(user) { where(created_by: user) }
  scope :for_category, ->(category) { where(expense_category_id: category) }

  private
  def create_transaction
    self.build_feed(company_id: self.company_id, created_by: self.created_by, date: self.date)
  end

end
