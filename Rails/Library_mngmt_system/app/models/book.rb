class Book < ApplicationRecord
  enum :status, [:available, :not_available]
end
