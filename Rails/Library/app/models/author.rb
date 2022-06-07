class Author < ApplicationRecord
  has_one :book 
end

=begin
# build_association(attributes = {})
# create_association(attributes = {})
3.0.0 :001 > book = Book.new
 => 
#<Book:0x000055ed3b59fd48 
3.0.0 :002 > author = Author.new
 => 
#<Author:0x000055ed3b14f1f8 
3.0.0 :003 > author.save
  TRANSACTION (0.2ms)  BEGIN
  Author Create (0.9ms)  INSERT INTO "authors" ("created_at", "updated_at", "lock_version", "email", "name", "books_count") VALUES ($1, $2, $3, $4, $5, $6) RETURNING "id"  [["created_at", "2022-06-07 13:42:37.915924"], ["updated_at", "2022-06-07 13:42:37.915924"], ["lock_version", 0], ["email", nil], ["name", nil], ["books_count", 0]]                    
  TRANSACTION (6.8ms)  COMMIT                                          
 => true 
3.0.0 :008 > book = book.create_author(name: 'Ram', email: 'ram12@gmail.com')
  TRANSACTION (0.1ms)  BEGIN
  Author Create (0.3ms)  INSERT INTO "authors" ("created_at", "updated_at", "lock_version", "email", "name", "books_count") VALUES ($1, $2, $3, $4, $5, $6) RETURNING "id"  [["created_at", "2022-06-07 13:44:27.937099"], ["updated_at", "2022-06-07 13:44:27.937099"], ["lock_version", 0], ["email", "ram12@gmail.com"], ["name", "Ram"], ["books_count", 0]]            
  Book Create (0.2ms)  INSERT INTO "books" ("title", "author", "created_at", "updated_at", "price", "lock_version", "author_id") VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING "id"  [["title", "English"], ["author", nil], ["created_at", "2022-06-07 13:44:27.938647"], ["updated_at", "2022-06-07 13:44:27.938647"], ["price", nil], ["lock_version", 0], ["author_id", 1000041]]
  TRANSACTION (0.4ms)  COMMIT                                                  
 =>                                                                            
#<Author:0x000055ed3b5f5ab8

3.0.0 :001 > book1 = Book.new
 => 
#<Book:0x000055b912ba9340 
3.0.0 :005 > book.save
  TRANSACTION (0.1ms)  BEGIN
  Author Create (0.4ms)  INSERT INTO "authors" ("created_at", "updated_at", "lock_version", "email", "name", "books_count") VALUES ($1, $2, $3, $4, $5, $6) RETURNING "id"  [["created_at", "2022-06-07 13:47:52.992899"], ["updated_at", "2022-06-07 13:47:52.992899"], ["lock_version", 0], ["email", "joe01@gmail.com"], ["name", "Joel"], ["books_count", 0]]       
  Book Create (0.3ms)  INSERT INTO "books" ("title", "author", "created_at", "updated_at", "price", "lock_version", "author_id") VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING "id"  [["title", nil], ["author", nil], ["created_at", "2022-06-07 13:47:52.996038"], ["updated_at", "2022-06-07 13:47:52.996038"], ["price", nil], ["lock_version", 0], ["author_id", 1000042]]
  TRANSACTION (6.7ms)  COMMIT                               
 => true 
3.0.0 :006 > book1.author
 => 
#<Author:0x000055b912c48e18                                  
 id: 1000042,                                                
 created_at: Tue, 07 Jun 2022 13:47:52.992899000 UTC +00:00, 
 updated_at: Tue, 07 Jun 2022 13:47:52.992899000 UTC +00:00, 
 lock_version: 0,                                            
 email: "joe01@gmail.com",                                   
 name: "Joel",                                               
 books_count: 0> 

 3.0.0 :008 > book = book1.build_author(name: 'Rajan', email: 'raju01@gmail.com')
 => 
#<Author:0x000055b9127af140 
3.0.0 :009 > book.save
  TRANSACTION (0.4ms)  BEGIN
  Author Create (0.6ms)  INSERT INTO "authors" ("created_at", "updated_at", "lock_version", "email", "name", "books_count") VALUES ($1, $2, $3, $4, $5, $6) RETURNING "id"  [["created_at", "2022-06-07 13:50:21.832953"], ["updated_at", "2022-06-07 13:50:21.832953"], ["lock_version", 0], ["email", "raju01@gmail.com"], ["name", "Rajan"], ["books_count", 0]]
  Book Update (0.3ms)  UPDATE "books" SET "updated_at" = $1, "author_id" = $2, "lock_version" = $3 WHERE "books"."id" = $4 AND "books"."lock_version" = $5  [["updated_at", "2022-06-07 13:50:21.836392"], ["author_id", 1000043], ["lock_version", 1], ["id", 15], ["lock_version", 0]]
  TRANSACTION (6.6ms)  COMMIT                               
 => true 
3.0.0 :010 > book1.author
 => 
#<Author:0x000055b9127af140                                  
 id: 1000043,                                                
 created_at: Tue, 07 Jun 2022 13:50:21.832953000 UTC +00:00, 
 updated_at: Tue, 07 Jun 2022 13:50:21.832953000 UTC +00:00, 
 lock_version: 0,                                            
 email: "raju01@gmail.com",                                  
 name: "Rajan",                                              
 books_count: 0>  
=end