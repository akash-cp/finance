class Expense < ActiveRecord::Base
  belongs_to :income_category
  belongs_to :creater, class_name: 'User', foreign_key: :created_by
  belongs_to :updater, class_name: 'User', foreign_key: :updated_by
  has_one :feed, as: :transactionable, class_name: 'Transaction'
  mount_uploader :attachment, AttachmentUploader

  before_save :create_transaction

  private
  def create_transaction
    self.build_feed
  end

end
