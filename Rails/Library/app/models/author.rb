class Author < ApplicationRecord
  self.primary_key = 'guid'
  has_many :books, inverse_of: :author
end

