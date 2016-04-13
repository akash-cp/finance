class Income < ActiveRecord::Base
  include Filterable

  EXPORT_TYPE = %w(Pdf Excel)

  belongs_to :income_category
  belongs_to :creater, class_name: 'User', foreign_key: :created_by
  belongs_to :updater, class_name: 'User', foreign_key: :updated_by
  has_one :feed, as: :transactionable, class_name: 'Transaction', dependent: :destroy
  mount_uploader :attachment, AttachmentUploader

  validates_numericality_of :amount, presence: true
  validates_presence_of :date
  validates_presence_of :income_category_id

  after_create :create_transaction

  scope :for_start_date, ->(start_date) { where('date >= ?', Date.parse(start_date)) }
  scope :for_end_date, ->(end_date) { where('date <= ?', Date.parse(end_date)) }
  scope :for_user_id, ->(user) { where(created_by: user) }
  scope :for_category_id, ->(category_id) { where(income_category_id: category_id) }

  private
  def create_transaction
    CreateFeedJob.new(self.id).enqueue(wait: 5.seconds)
  end

end