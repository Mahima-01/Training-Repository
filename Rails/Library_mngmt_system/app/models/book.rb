class Book < ApplicationRecord
  enum :status, [:available, :not_available]
  belongs_to :author
  has_one :category
end
