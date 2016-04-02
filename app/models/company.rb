class Company < ActiveRecord::Base
  has_many :users
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  validates :name, uniqueness: true

end
