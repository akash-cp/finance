class Role < ActiveRecord::Base

  has_many :user
  belongs_to :company

end
