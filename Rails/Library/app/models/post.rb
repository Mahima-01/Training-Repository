class Post < ApplicationRecord
  # belongs to both author and category
  belongs_to :author
  belongs_to :category
end
