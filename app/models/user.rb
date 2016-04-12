class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  mount_uploader :avatar, AvatarUploader

  belongs_to :role
  belongs_to :company

  attr_accessor :company_name, :subdomain, :company_attributes


  validates :company_name, presence: true, on: :create, allow_blank: false
  validates :subdomain, presence: true, on: :create, allow_blank: false
  validates :email, presence: true, uniqueness: {scope: :company_id}, on: :create, allow_blank: false
  validate :avatar_size_validation

  before_create :create_company, unless: :invited_to_sign_up?
  after_create :assign_owner_id_to_company, unless: :invited_to_sign_up?

  def create_company
    if company_id.nil?
      company = Company.new(name: self.company_name, subdomain: self.subdomain)
      if company.save
        self.company_id = company.id
        role = Role.new(title: 'Admin', company_id: company.id)
        self.role_id = role.id if role.save
      else
        errors[:base] << 'Company or Subdomain already exists'
        return false
      end
    end
  end

  def assign_owner_id_to_company
    company = Company.find_by(id: self.company_id)
    company.update_attributes(owner_id: self.id)
  end

  private

  def avatar_size_validation
    errors[:avatar] << 'Should be less than 2 MB' if avatar.size > 2.megabytes
  end

end
