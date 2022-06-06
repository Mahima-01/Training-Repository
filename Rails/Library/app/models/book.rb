class Book < ApplicationRecord
  belongs_to :author
end

=begin
build_association(attributes = {})
The build_association method returns a new object of the associated type. 
This object will be instantiated from the passed attributes, and the link through this object's foreign key will be set, but the associated object will not yet be saved.
3.0.0 :019 > book1 = Book.new
 => #<Book:0x000056169a231f70 id: nil, title: nil, author: nil, created_at: nil, updated_at: nil, price: nil, lock_version: 0, author_id: nil> 
3.0.0 :026 > book.save
  TRANSACTION (0.2ms)  BEGIN
  Book Update (0.4ms)  UPDATE "books" SET "title" = $1, "updated_at" = $2, "lock_version" = $3 WHERE "books"."id" = $4 AND "books"."lock_version" = $5  [["title", "Mathematics"], ["updated_at", "2022-06-06 11:36:45.319017"], ["lock_version", 1], ["id", 5], ["lock_version", 0]]
  TRANSACTION (6.6ms)  COMMIT                    
 => true 
3.0.0 :029 > book = book1.build_author(name: 'Joe', email: 'joe12@gmail.com')
 => #<Author:0x00007f83d8dcfd80 id: nil, created_at: nil, updated_at: nil, lock_version: 0, email: "joe12@gmail.com", name: "Joe"> 
3.0.0 :030 > book.save
  TRANSACTION (0.3ms)  BEGIN
  Author Create (0.6ms)  INSERT INTO "authors" ("created_at", "updated_at", "lock_version", "email", "name") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["created_at", "2022-06-06 11:45:17.961855"], ["updated_at", "2022-06-06 11:45:17.961855"], ["lock_version", 0], ["email", "joe12@gmail.com"], ["name", "Joe"]]
  TRANSACTION (1.5ms)  COMMIT                    
 => true 
3.0.0 :031 > book1.author
 => 
#<Author:0x00007f83d8dcfd80                                              
 id: 1000025,                                                            
 created_at: Mon, 06 Jun 2022 11:45:17.961855000 UTC +00:00,             
 updated_at: Mon, 06 Jun 2022 11:45:17.961855000 UTC +00:00,             
 lock_version: 0,                                                        
 email: "joe12@gmail.com",                                               
 name: "Joe"> 
=end

