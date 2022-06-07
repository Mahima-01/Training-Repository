class Book < ApplicationRecord
  belongs_to :author, counter_cache: true
end


=begin
# :counter_cache
The :counter_cache option can be used to make finding the number of belonging objects more efficient.
Although the :counter_cache option is specified on the model that includes the belongs_to declaration, 
the actual column must be added to the associated (has_many) model. 
3.0.0 :012 > author.books.size
  Book Count (1.9ms)  SELECT COUNT(*) FROM "books" WHERE "books"."author_id" = $1  [["author_id", 1000027]]
 => 0  
=end