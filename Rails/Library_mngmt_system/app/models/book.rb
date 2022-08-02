class Book < ApplicationRecord
  enum :status, [:available, :not_available]
  belongs_to :author
  belongs_to :category
end
