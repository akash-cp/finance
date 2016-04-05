class Transaction < ActiveRecord::Base
  belongs_to :company
  belongs_to :transactionable, polymorphic: true
end
