class Author < ApplicationRecord
  has_many :books, dependent: :destroy
end


 
=begin                                
3.0.0 :008 > book2 = Book.new
 => #<Book:0x000055f9eb7e2260 id: nil, title: nil, author: nil, created_at: nil, updated_at: nil, price: nil, lock_version: 0, author_id: nil> 
3.0.0 :009 > book = book2.create_author(name: 'Joe', email: 'joe12@gmail.com')
  TRANSACTION (0.1ms)  BEGIN
  Author Create (0.2ms)  INSERT INTO "authors" ("created_at", "updated_at", "lock_version", "email", "name") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["created_at", "2022-06-07 07:49:57.701935"], ["updated_at", "2022-06-07 07:49:57.701935"], ["lock_version", 0], ["email", "joe12@gmail.com"], ["name", "Joe"]]
  TRANSACTION (6.5ms)  COMMIT                             
 =>                                                       
#<Author:0x00007fb0a4173480
3.0.0 :010 > book2.author
 => 
#<Author:0x00007fb0a4173480                                                        
 id: 1000030,                                                                      
 created_at: Tue, 07 Jun 2022 07:49:57.701935000 UTC +00:00,                       
 updated_at: Tue, 07 Jun 2022 07:49:57.701935000 UTC +00:00,                       
 lock_version: 0,                                                                  
 email: "joe12@gmail.com",                                                         
 name: "Joe"> 
3.0.0 :016 > author = book2.author
 => 
#<Author:0x00007fb0a4173480  

=end