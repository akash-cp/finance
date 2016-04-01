class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :company_name, :subdomain

  belongs_to :company

  validates :company_name, presence: true
  validates :subdomain, presence: true

  before_create :create_company
  after_create :assign_owner_id_to_company

  def create_company
    company = Company.new(name: self.company_name, subdomain: self.subdomain)
    if company.save
      self.company_id = company.id
    end

  end

  def assign_owner_id_to_company
    company = Company.find_by(id: self.company_id)
    company.update_attributes(owner_id: self.id)
  end

end
