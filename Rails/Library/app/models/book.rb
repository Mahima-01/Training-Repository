class Book < ApplicationRecord
  belongs_to :author
end

=begin
Here are a few things you should know to make efficient use of Active Record associations in your Rails applications:

Controlling caching
Avoiding name collisions
Updating the schema
Controlling association scope
Bi-directional associations

Controlling Caching:
All of the association methods are built around caching, which keeps the result of the most recent query available for further operations.

3.0.0 :002 > book2 = Book.new
 => #<Book:0x000055e44ef30560 id: nil, title: nil, author: nil, created_at: nil, updated_at: nil, price: nil, lock_version: 0, author_id: nil> 
3.0.0 :003 > book = book2.create_author(name: 'Joe', email: 'joe12@gmail.com')
  TRANSACTION (0.1ms)  BEGIN
  Author Create (0.5ms)  INSERT INTO "authors" ("created_at", "updated_at", "lock_version", "email", "name") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["created_at", "2022-06-06 13:22:52.066831"], ["updated_at", "2022-06-06 13:22:52.066831"], ["lock_version", 0], ["email", "joe12@gmail.com"], ["name", "Joe"]]
  TRANSACTION (6.5ms)  COMMIT                              
 =>                                                        
#<Author:0x000055e44eabb0c0 
3.0.0 :004 > book2.author
 => 
#<Author:0x000055e44eabb0c0                           
 id: 1000028,                                         
 created_at: Mon, 06 Jun 2022 13:22:52.066831000 UTC +00:00,
 updated_at: Mon, 06 Jun 2022 13:22:52.066831000 UTC +00:00,
 lock_version: 0,                                
 email: "joe12@gmail.com",                       
 name: "Joe"> 
 3.0.0 :007 > book2.save!
  TRANSACTION (0.4ms)  BEGIN
  Book Create (0.8ms)  INSERT INTO "books" ("title", "author", "created_at", "updated_at", "price", "lock_version", "author_id") VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING "id"  [["title", nil], ["author", nil], ["created_at", "2022-06-06 13:25:09.703208"], ["updated_at", "2022-06-06 13:25:09.703208"], ["price", nil], ["lock_version", 0], ["author_id", 1000028]]
  TRANSACTION (1.5ms)  COMMIT                                                      
 => true 
author = Author.find(1000028)
3.0.0 :013 > author.books.load
 => 
[#<Book:0x000055e44ec03608                                                         
  id: 7,                                                                           
  title: nil,                                                                      
  author: nil,                                        
  created_at: Mon, 06 Jun 2022 13:25:09.703208000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 13:25:09.703208000 UTC +00:00,
  price: nil,                                         
  lock_version: 0,                                    
  author_id: 1000028>] 

  3.0.0 :015 > author.books.reload
  Book Load (0.5ms)  SELECT "books".* FROM "books" WHERE "books"."author_id" = $1  [["author_id", 1000028]]
 =>                                                                                
[#<Book:0x000055e44ec99d88                                                         
  id: 7,                                                                           
  title: nil,                                                                      
  author: nil,                                                                     
  created_at: Mon, 06 Jun 2022 13:25:09.703208000 UTC +00:00,                      
  updated_at: Mon, 06 Jun 2022 13:25:09.703208000 UTC +00:00,                      
  price: nil,                                                                      
  lock_version: 0,                                                                 
  author_id: 1000028>,                                                             
 #<Book:0x000055e44ec99bf8                                                         
  id: 8,                                                                           
  title: "bio",                                                                    
  author: nil,
  created_at: Mon, 06 Jun 2022 13:28:24.587359000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 13:28:24.587359000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000028>] 

  3.0.0 :003 > author.books.create(:title => "bio")
  TRANSACTION (0.0ms)  BEGIN
3.0.0 :004 > author.books.load
  Book Load (0.3ms)  SELECT "books".* FROM "books" WHERE "books"."author_id" = $1  [["author_id", 1000028]]
 =>                                                                                
[#<Book:0x000055ebb5798e88                                                         
  id: 7,                                                                           
  title: nil,                                                                      
  author: nil,                                                                     
  created_at: Mon, 06 Jun 2022 13:25:09.703208000 UTC +00:00,                      
  updated_at: Mon, 06 Jun 2022 13:25:09.703208000 UTC +00:00,                      
  price: nil,                                                                      
  lock_version: 0,                                                                 
  author_id: 1000028>,                                                             
 #<Book:0x000055ebb55aaf90                                                         
  id: 8,                                                                           
  title: "bio",                                                                    
  author: nil,
  created_at: Mon, 06 Jun 2022 13:28:24.587359000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 13:28:24.587359000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000028>] 

# Size:
# uses the cached copy of books
3.0.0 :007 > author.books.size
 => 2 

 3.0.0 :008 > author.books.empty?
 => false 

=end
