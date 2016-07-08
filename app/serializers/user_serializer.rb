class UserSerializer < Api::V1::BaseSerializer
  attributes :id, :name, :company_id
  belongs_to :company
end