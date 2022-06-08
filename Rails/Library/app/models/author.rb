class Author < ApplicationRecord
  has_many :books
end

=begin
# has_many Association Reference
The has_many association creates a one-to-many relationship with another model. In database terms, this association says that the other class will have a foreign key that refers to instances of this class.
Methods Added by has_many
When you declare a has_many association, the declaring class automatically gains 17 methods related to the association:
collection
collection<<(object, ...)
collection.delete(object, ...)
collection.destroy(object, ...)
collection=(objects)
collection_singular_ids
collection_singular_ids=(ids)
collection.clear
collection.empty?
collection.size
collection.find(...)
collection.where(...)
collection.exists?(...)
collection.build(attributes = {})
collection.create(attributes = {})
collection.create!(attributes = {})
collection.reload

#collection
The collection method returns a Relation of all of the associated objects. If there are no associated objects, it returns an empty Relation.
3.0.0 :001 > book2 = Book.new
 => #<Book:0x00007fe9b035de18 id: nil, title: nil, author: nil, created_at: nil, updated_at: nil, price: nil, lock_version: 0, author_id: nil> 
3.0.0 :002 > book = book2.build_author(name: 'Ram', email: 'ram11@gmail.com')
 => #<Author:0x00007f05d8a4c588 id: nil, created_at: nil, updated_at: nil, lock_version: 0, email: "ram11@gmail.com", name: "Ram", books_count: 0> 
3.0.0 :003 > book.save
  TRANSACTION (0.1ms)  BEGIN
  Author Create (0.4ms)  INSERT INTO "authors" ("created_at", "updated_at", "lock_version", "email", "name", "books_count") VALUES ($1, $2, $3, $4, $5, $6) RETURNING "id"  [["created_at", "2022-06-08 07:04:23.023413"], ["updated_at", "2022-06-08 07:04:23.023413"], ["lock_version", 0], ["email", "ram11@gmail.com"], ["name", "Ram"], ["books_count", 0]]
  TRANSACTION (6.0ms)  COMMIT                                       
 => true  
3.0.0 :004 > book2.save!
  TRANSACTION (0.2ms)  BEGIN
  Book Create (0.8ms)  INSERT INTO "books" ("title", "author", "created_at", "updated_at", "price", "lock_version", "author_id") VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING "id"  [["title", nil], ["author", nil], ["created_at", "2022-06-08 07:04:48.932877"], ["updated_at", "2022-06-08 07:04:48.932877"], ["price", nil], ["lock_version", 0], ["author_id", 1000045]]
  TRANSACTION (6.7ms)  COMMIT                                       
 => true  
3.0.0 :006 > author = book2.author
 => 
#<Author:0x00007f05d8a4c588 
3.0.0 :007 > author.books
  Book Load (0.2ms)  SELECT "books".* FROM "books" WHERE "books"."author_id" = $1  [["author_id", 1000045]]
 =>                                                                          
[#<Book:0x00007f05d884dea8                                                   
  id: 17,                                                                    
  title: nil,                                                                
  author: nil,                                                               
  created_at: Wed, 08 Jun 2022 07:04:48.932877000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:04:48.932877000 UTC +00:00,
  price: nil,                                             
  lock_version: 0,                                        
  author_id: 1000045>] 

# collection<<(object, ...)
The collection<< method adds one or more objects to the collection by setting their foreign keys to the primary key of the calling model.
3.0.0 :009 > author = Author.find(1000028)
  Author Load (7.0ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" = $1 LIMIT $2  [["id", 1000028], ["LIMIT", 1]]
 =>                                                                                
#<Author:0x000055928a0cf6f8  
3.0.0 :013 > author1 = Author.new
 => #<Author:0x000055928a165c20 id: nil, created_at: nil, updated_at: nil, lock_version: 0, email: nil, name: nil, books_count: 0> 
3.0.0 :014 > book = book2.build_author(name: 'Nancy', email: 'nan11@gmail.com')
 => #<Author:0x000055928a1fc788 id: nil, created_at: nil, updated_at: nil, lock_version: 0, email: "nan11@gmail.com", name: "Nancy", books_count: 0> 
3.0.0 :015 > book2.save
  TRANSACTION (0.1ms)  BEGIN
  Author Create (0.3ms)  INSERT INTO "authors" ("created_at", "updated_at", "lock_version", "email", "name", "books_count") VALUES ($1, $2, $3, $4, $5, $6) RETURNING "id"  [["created_at", "2022-06-08 07:13:18.509305"], ["updated_at", "2022-06-08 07:13:18.509305"], ["lock_version", 0], ["email", "nan11@gmail.com"], ["name", "Nancy"], ["books_count", 0]]
  Book Update (0.4ms)  UPDATE "books" SET "updated_at" = $1, "author_id" = $2, "lock_version" = $3 WHERE "books"."id" = $4 AND "books"."lock_version" = $5  [["updated_at", "2022-06-08 07:13:18.510618"], ["author_id", 1000046], ["lock_version", 1], ["id", 17], ["lock_version", 0]]
  TRANSACTION (6.5ms)  COMMIT                                           
 => true 
3.0.0 :018 > author = Author.find(1000046)
  Author Load (0.6ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" = $1 LIMIT $2  [["id", 1000046], ["LIMIT", 1]]
 =>                                                          
#<Author:0x0000559289c65b08 
3.0.0 :019 > author.books << book2
  Book Load (0.5ms)  SELECT "books".* FROM "books" WHERE "books"."author_id" = $1  [["author_id", 1000046]]
 =>                                                           
[#<Book:0x00007f05d8539be0                                    
  id: 17,                                                     
  title: nil,                                                 
  author: nil,                                                
  created_at: Wed, 08 Jun 2022 07:04:48.932877000 UTC +00:00, 
  updated_at: Wed, 08 Jun 2022 07:13:18.510618000 UTC +00:00, 
  price: nil,                                                 
  lock_version: 1,                                            
  author_id: 1000046>] 
3.0.0 :022 > book = book1.build_author(name: 'Nany', email: 'nany11@gmail.com')
 => #<Author:0x0000559289946030 id: nil, created_at: nil, updated_at: nil, lock_version: 0, email: "nany11@gmail.com", name: "Nany", books_count: 0> 
3.0.0 :023 > book1.save!
  TRANSACTION (0.3ms)  BEGIN
  Author Create (0.2ms)  INSERT INTO "authors" ("created_at", "updated_at", "lock_version", "email", "name", "books_count") VALUES ($1, $2, $3, $4, $5, $6) RETURNING "id"  [["created_at", "2022-06-08 07:18:08.036206"], ["updated_at", "2022-06-08 07:18:08.036206"], ["lock_version", 0], ["email", "nany11@gmail.com"], ["name", "Nany"], ["books_count", 0]]
  Book Create (0.2ms)  INSERT INTO "books" ("title", "author", "created_at", "updated_at", "price", "lock_version", "author_id") VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING "id"  [["title", nil], ["author", nil], ["created_at", "2022-06-08 07:18:08.037915"], ["updated_at", "2022-06-08 07:18:08.037915"], ["price", nil], ["lock_version", 0], ["author_id", 1000047]]
  TRANSACTION (6.5ms)  COMMIT                                       
 => true 
3.0.0 :024 > author.books << book2 << book1
  TRANSACTION (0.1ms)  BEGIN
  Book Update (0.3ms)  UPDATE "books" SET "updated_at" = $1, "author_id" = $2, "lock_version" = $3 WHERE "books"."id" = $4 AND "books"."lock_version" = $5  [["updated_at", "2022-06-08 07:18:24.774880"], ["author_id", 1000046], ["lock_version", 1], ["id", 18], ["lock_version", 0]]
  TRANSACTION (6.6ms)  COMMIT                                
 =>                                                          
[#<Book:0x00007f05d8539be0                                   
  id: 17,
  title: nil,
  author: nil,
  created_at: Wed, 08 Jun 2022 07:04:48.932877000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:13:18.510618000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1000046>,
 #<Book:0x00007f05d8539be0
  id: 17,
  title: nil,
  author: nil,
  created_at: Wed, 08 Jun 2022 07:04:48.932877000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:13:18.510618000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1000046>,
 #<Book:0x00007f05d8539be0
  id: 17,
  title: nil,
  author: nil,
  created_at: Wed, 08 Jun 2022 07:04:48.932877000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:13:18.510618000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1000046>,
 #<Book:0x000055928a07d100
  id: 18,
  title: nil,
  author: nil,
  created_at: Wed, 08 Jun 2022 07:18:08.037915000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:18:24.774880000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1000046>] 
3.0.0 :028 > book3 = Book.new
 => #<Book:0x0000559289ebe698 id: nil, title: nil, author: nil, created_at: nil, updated_at: nil, price: nil, lock_version: 0, author_id: nil> 
3.0.0 :031 > book = book3.build_author(name: 'Mihir', email: 'mihir@gmail.com')
 => #<Author:0x000055928987c460 id: nil, created_at: nil, updated_at: nil, lock_version: 0, email: "mihir@gmail.com", name: "Mihir", books_count: 0> 
3.0.0 :032 > book3.save!
  TRANSACTION (0.2ms)  BEGIN
  Author Create (0.2ms)  INSERT INTO "authors" ("created_at", "updated_at", "lock_version", "email", "name", "books_count") VALUES ($1, $2, $3, $4, $5, $6) RETURNING "id"  [["created_at", "2022-06-08 07:22:47.937445"], ["updated_at", "2022-06-08 07:22:47.937445"], ["lock_version", 0], ["email", "mihir@gmail.com"], ["name", "Mihir"], ["books_count", 0]]
  Book Create (0.1ms)  INSERT INTO "books" ("title", "author", "created_at", "updated_at", "price", "lock_version", "author_id") VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING "id"  [["title", nil], ["author", nil], ["created_at", "2022-06-08 07:22:47.938790"], ["updated_at", "2022-06-08 07:22:47.938790"], ["price", nil], ["lock_version", 0], ["author_id", 1000048]]
  TRANSACTION (6.5ms)  COMMIT                                       
 => true  
3.0.0 :034 > author.books << book2 << book1 << book3
  TRANSACTION (0.2ms)  BEGIN
  Book Update (0.3ms)  UPDATE "books" SET "updated_at" = $1, "author_id" = $2, "lock_version" = $3 WHERE "books"."id" = $4 AND "books"."lock_version" = $5  [["updated_at", "2022-06-08 07:23:31.599295"], ["author_id", 1000046], ["lock_version", 1], ["id", 19], ["lock_version", 0]]
  TRANSACTION (1.5ms)  COMMIT                              
 =>                                                        
[#<Book:0x00007f05d8539be0                                 
  id: 17,                                                  
  title: nil,                                              
  author: nil,                                             
  created_at: Wed, 08 Jun 2022 07:04:48.932877000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:13:18.510618000 UTC +00:00,
  price: nil,                                       
  lock_version: 1,                                  
  author_id: 1000046>,                              
 #<Book:0x00007f05d8539be0
  id: 17,
  title: nil,
  author: nil,
  created_at: Wed, 08 Jun 2022 07:04:48.932877000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:13:18.510618000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1000046>,
 #<Book:0x00007f05d8539be0
  id: 17,
  title: nil,
  author: nil,
  created_at: Wed, 08 Jun 2022 07:04:48.932877000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:13:18.510618000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1000046>,
 #<Book:0x000055928a07d100
  id: 18,
  title: nil,
  author: nil,
  created_at: Wed, 08 Jun 2022 07:18:08.037915000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:18:24.774880000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1000046>,
 #<Book:0x00007f05d8539be0
  id: 17,
  title: nil,
  author: nil,
  created_at: Wed, 08 Jun 2022 07:04:48.932877000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:13:18.510618000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1000046>,
 #<Book:0x000055928a07d100
  id: 18,
  title: nil,
  author: nil,
  created_at: Wed, 08 Jun 2022 07:18:08.037915000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:18:24.774880000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1000046>,
 #<Book:0x0000559289ebe698
  id: 19,
  title: nil,
  author: nil,
  created_at: Wed, 08 Jun 2022 07:22:47.938790000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:23:31.599295000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1000046>] 

3.0.0 :036 > book1.author
 => 
#<Author:0x0000559289c65b08                                            
 id: 1000046,                                                          
 created_at: Wed, 08 Jun 2022 07:13:18.509305000 UTC +00:00,           
 updated_at: Wed, 08 Jun 2022 07:13:18.509305000 UTC +00:00,           
 lock_version: 0,                                                      
 email: "nan11@gmail.com",                                             
 name: "Nancy",                                                        
 books_count: 0> 

3.0.0 :043 > book3.author
 => 
#<Author:0x0000559289f8fe00                                                       
 id: 1000049,                                                                     
 created_at: Wed, 08 Jun 2022 07:26:37.512593000 UTC +00:00,                      
 updated_at: Wed, 08 Jun 2022 07:26:37.512593000 UTC +00:00,                      
 lock_version: 0,                                                                 
 email: "mihir@gmail.com",                                                        
 name: "Mihir",                                              
 books_count: 0>  

3.0.0 :046 > book = book2.build_author(name: 'Nina', email: 'nina@gmail.com')
 => #<Author:0x00007f05d8602a68 id: nil, created_at: nil, updated_at: nil, lock_version: 0, email: "nina@gmail.com", name: "Nina", books_count: 0> 
3.0.0 :047 > book2.author.save
  TRANSACTION (0.3ms)  BEGIN
  Author Create (0.5ms)  INSERT INTO "authors" ("created_at", "updated_at", "lock_version", "email", "name", "books_count") VALUES ($1, $2, $3, $4, $5, $6) RETURNING "id"  [["created_at", "2022-06-08 07:29:03.097290"], ["updated_at", "2022-06-08 07:29:03.097290"], ["lock_version", 0], ["email", "nina@gmail.com"], ["name", "Nina"], ["books_count", 0]]
  TRANSACTION (6.6ms)  COMMIT                                                      
 => true  
3.0.0 :048 > book2.author
 => 
#<Author:0x00007f05d8602a68                                                        
 id: 1000050,                                                                      
 created_at: Wed, 08 Jun 2022 07:29:03.097290000 UTC +00:00,                       
 updated_at: Wed, 08 Jun 2022 07:29:03.097290000 UTC +00:00,                       
 lock_version: 0,                                                                  
 email: "nina@gmail.com",                                                          
 name: "Nina",                                               
 books_count: 0>                                             

=end