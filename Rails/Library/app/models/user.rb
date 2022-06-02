class User <ApplicationRecord
  include ActiveModel::Validations
  validates :first_name, My: true
end
