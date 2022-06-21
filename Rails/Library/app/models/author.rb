class Author < ApplicationRecord
  has_many :books
  has_many :categories
  after_touch :log_when_books_or_categories

  private
    def log_when_books_or_categories
      puts 'Book/Categories was touched'
    end
end
