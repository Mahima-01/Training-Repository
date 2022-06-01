class Author < ApplicationRecord
  validates :email, uniqueness: true, on: :create
  validates :title, presence: true
end
 