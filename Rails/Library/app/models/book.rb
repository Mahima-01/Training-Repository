class Book < ApplicationRecord
  belongs_to :author, touch: true
  after_touch do
    puts 'An author was touched'
  end
end

=begin
#It can be used along with belongs_to:
3.0.0 :001 > @book = Book.last
  Book Load (1.3ms)  SELECT "books".* FROM "books" ORDER BY "books"."id" DESC LIMIT $1  [["LIMIT", 1]]
 =>                                                                
#<Book:0x000055a072031a98

3.0.0 :003 > @book
 => 
#<Book:0x000055a072031a98                                          
 id: 24,                                                           
 title: "Programming",            
 author: nil,                   
 created_at: Wed, 08 Jun 2022 09:30:32.962006000 UTC +00:00,
 updated_at: Wed, 08 Jun 2022 09:30:32.962006000 UTC +00:00,
 price: 0.6e3,
 lock_version: 0,
 author_id: 1000052> 

3.0.0 :004 > @book.touch
  TRANSACTION (0.1ms)  BEGIN
  Book Update (0.4ms)  UPDATE "books" SET "updated_at" = $1, "lock_version" = $2 WHERE "books"."id" = $3 AND "books"."lock_version" = $4  [["updated_at", "2022-06-21 13:24:30.419496"], ["lock_version", 1], ["id", 24], ["lock_version", 0]]
  TRANSACTION (1.2ms)  COMMIT                                
 => true 
=end