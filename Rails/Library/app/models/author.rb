class Author < ApplicationRecord
  has_many :books
end

=begin
# collection.size
The collection.size method returns the number of objects in the collection.
3.0.0 :134 > author.books.size
 => 3 

#  collection.find(...)
The collection.find method finds objects within the collection's table.
3.0.0 :138 > author.books.find(19)
  Book Load (0.6ms)  SELECT "books".* FROM "books" WHERE "books"."author_id" = $1 AND "books"."id" = $2 LIMIT $3  [["author_id", 1000046], ["id", 19], ["LIMIT", 1]]
 =>                                                 
#<Book:0x00007f05d8541ac0                           
 id: 19,                                            
 title: nil,                                        
 author: nil,                                       
 created_at: Wed, 08 Jun 2022 07:22:47.938790000 UTC +00:00,
 updated_at: Wed, 08 Jun 2022 07:23:31.599295000 UTC +00:00,
 price: nil,                                        
 lock_version: 1,                                   
 author_id: 1000046>  

# collection.where(...)
The collection.where method finds objects within the collection based on the conditions supplied but the objects are loaded lazily 
meaning that the database is queried only when the object(s) are accessed.
3.0.0 :145 > author.books.first
 => 
#<Book:0x0000559289ebe698                                               
 id: 19,                                                                
 title: nil,                                                            
 author: nil,                                                           
 created_at: Wed, 08 Jun 2022 07:22:47.938790000 UTC +00:00,            
 updated_at: Wed, 08 Jun 2022 07:23:31.599295000 UTC +00:00,            
 price: nil,                                                            
 lock_version: 1,                                                       
 author_id: 1000046> 

 3.0.0 :150 > author.books.where(:title == 'Rails')
  Book Load (0.2ms)  SELECT "books".* FROM "books" WHERE "books"."author_id" = $1  [["author_id", 1000046]]
 =>                                                       
[#<Book:0x0000559289fb4bd8                                
  id: 19,                                                 
  title: nil,                                             
  author: nil,                                                                                               
  created_at: Wed, 08 Jun 2022 07:22:47.938790000 UTC +00:00,                                                
  updated_at: Wed, 08 Jun 2022 07:23:31.599295000 UTC +00:00,                                                
  price: nil,                                                                                                
  lock_version: 1,                                                                                           
  author_id: 1000046>] 

#  collection.exists?(...)
The collection.exists? method checks whether an object meeting the supplied conditions exists in the collection's table.
3.0.0 :152 > author.books.exists?
  Book Exists? (0.7ms)  SELECT 1 AS one FROM "books" WHERE "books"."author_id" = $1 LIMIT $2  [["author_id", 1000046], ["LIMIT", 1]]
 => true 
=end