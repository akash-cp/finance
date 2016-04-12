class PhoneNumber < ActiveRecord::Base
  validates_presence_of :number, presence: true, length: 10

  belongs_to :company
end
