class Author < ApplicationRecord
  has_many :books
end

=begin
# collection.build: 
The collection.build method returns a single or array of new objects of the associated type.
3.0.0 :183 > book = author.books.build(title: 'Maths', price: '650')
 => #<Book:0x0000559289decd78 id: nil, title: "Maths", author: nil, created_at: nil, updated_at: nil, price: 0.65e3, lock_version: 0, author_id: 1000051> 
3.0.0 :185 > author = Author.new
 => #<Author:0x0000559289c55a28 id: nil, created_at: nil, updated_at: nil, lock_version: 0, email: nil, name: nil, books_count: 0> 
3.0.0 :186 > book = author.books.build(title: 'Science', price: '600')
 => #<Book:0x0000559289a05458 id: nil, title: "Science", author: nil, created_at: nil, updated_at: nil, price: 0.6e3, lock_version: 0, author_id: nil> 
3.0.0 :188 > author.books
 => [#<Book:0x0000559289a05458 id: nil, title: "Science", author: nil, created_at: nil, updated_at: nil, price: 0.6e3, lock_version: 0, author_id: nil>] 

# collection.create: 
The collection.create method returns a single or array of new objects of the associated type. The object(s) will be instantiated from the passed attributes, 
the link through its foreign key will be created, and, once it passes all of the validations specified on the associated model, the associated object will be saved. 
3.0.0 :008 > book = author.books.create(title: 'Programming', price: '600')
  TRANSACTION (0.1ms)  BEGIN
  Book Create (0.3ms)  INSERT INTO "books" ("title", "author", "created_at", "updated_at", "price", "lock_version", "author_id") VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING "id"  [["title", "Programming"], ["author", nil], ["created_at", "2022-06-08 09:30:32.962006"], ["updated_at", "2022-06-08 09:30:32.962006"], ["price", "600.0"], ["lock_version", 0], ["author_id", 1000052]]
  TRANSACTION (6.5ms)  COMMIT                     
 =>                                               
#<Book:0x0000555e6d9b11c8  
3.0.0 :009 > author.books
  Book Load (0.4ms)  SELECT "books".* FROM "books" WHERE "books"."author_id" = $1  [["author_id", 1000052]]
 =>                                                           
[#<Book:0x0000555e6d9b11c8                                    
  id: 24,                                                     
  title: "Programming",                                       
  author: nil,                                                
  created_at: Wed, 08 Jun 2022 09:30:32.962006000 UTC +00:00, 
  updated_at: Wed, 08 Jun 2022 09:30:32.962006000 UTC +00:00, 
  price: 0.6e3,                                               
  lock_version: 0,                                            
  author_id: 1000052>] 

# collection.create!(attributes = {})
Does the same as collection.create above, but raises ActiveRecord::RecordInvalid if the record is invalid.

# collection.reload
The collection.reload method returns a Relation of all of the associated objects, 
forcing a database read. If there are no associated objects, it returns an empty Relation.
3.0.0 :010 > author.reload
  Author Load (0.8ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" = $1 LIMIT $2  [["id", 1000052], ["LIMIT", 1]]
 =>                                                           
#<Author:0x0000555e6cf47bd8                                   
 id: 1000052,                                                 
 created_at: Wed, 08 Jun 2022 09:30:26.523067000 UTC +00:00,  
 updated_at: Wed, 08 Jun 2022 09:30:26.523067000 UTC +00:00,  
 lock_version: 0,                                             
 email: nil,                                                  
 name: nil,                                                   
 books_count: 0> 
=end
