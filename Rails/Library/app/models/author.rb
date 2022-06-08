class Author < ApplicationRecord
  has_many :books
end

=begin
# collection.delete(object, ...)
The collection.delete method removes one or more objects from the collection by setting their foreign keys to NULL.
3.0.0 :059 > author.books.delete(book1)
  TRANSACTION (0.1ms)  BEGIN
  Book Update All (0.2ms)  UPDATE "books" SET "author_id" = $1, "lock_version" = COALESCE("lock_version", 0) + $2 WHERE "books"."author_id" = $3 AND "books"."id" = $4  [["author_id", nil], ["lock_version", 1], ["author_id", 1000046], ["id", 18]]              
  TRANSACTION (0.1ms)  COMMIT                                
 =>                                                          
[#<Book:0x000055928a07d100                          
  id: 18,                                           
  title: nil,                                       
  author: nil,                                      
  created_at: Wed, 08 Jun 2022 07:18:08.037915000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:18:24.774880000 UTC +00:00,
  price: nil,                                       
  lock_version: 1,                                  
  author_id: 1000046>] 


3.0.0 :061 > author.books
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
 #<Book:0x00007f05d8539be0
  id: 17,
  title: nil,
  author: nil,
  created_at: Wed, 08 Jun 2022 07:04:48.932877000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:13:18.510618000 UTC +00:00,
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
 #<Book:0x0000559289ebe698
  id: 19,
  title: nil,
  author: nil,
  created_at: Wed, 08 Jun 2022 07:22:47.938790000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:23:31.599295000 UTC +00:00,
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
  author_id: 1000046>] 

# collection.destroy(object, ...)
The collection.destroy method removes one or more objects from the collection by running destroy on each object.
3.0.0 :063 > author.books.destroy(book2)
  TRANSACTION (0.2ms)  BEGIN
  Book Destroy (0.2ms)  DELETE FROM "books" WHERE "books"."id" = $1 AND "books"."lock_version" = $2  [["id", 17], ["lock_version", 1]]
  TRANSACTION (1.3ms)  COMMIT                                                      
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
3.0.0 :061 > author.books
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
 #<Book:0x00007f05d8539be0
  id: 17,
  title: nil,
  author: nil,
  created_at: Wed, 08 Jun 2022 07:04:48.932877000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:13:18.510618000 UTC +00:00,
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
 #<Book:0x0000559289ebe698
  id: 19,
  title: nil,
  author: nil,
  updated_at: Wed, 08 Jun 2022 07:23:31.599295000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1000046>,
 #<Book:0x00007f05d8539be0
3.0.0 :064 > author.books
 => 
[#<Book:0x0000559289ebe698                          
  id: 19,                                           
  title: nil,                                       
  author: nil,                                      
  created_at: Wed, 08 Jun 2022 07:22:47.938790000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:23:31.599295000 UTC +00:00,
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

3.0.0 :067 > author
 => 
#<Author:0x0000559289c65b08
 id: 1000046,          
 created_at: Wed, 08 Jun 2022 07:13:18.509305000 UTC +00:00,
 updated_at: Wed, 08 Jun 2022 07:13:18.509305000 UTC +00:00,
 lock_version: 0,      
 email: "nan11@gmail.com",
 name: "Nancy",        
 books_count: 0> 

3.0.0 :068 > author.destroy
  TRANSACTION (0.3ms)  BEGIN
  Author Destroy (0.3ms)  DELETE FROM "authors" WHERE "authors"."id" = $1 AND "authors"."lock_version" = $2  [["id", 1000046], ["lock_version", 0]]
  TRANSACTION (6.6ms)  COMMIT                                 
 =>                                                           
#<Author:0x0000559289c65b08                                   
 id: 1000046,                                                 
 created_at: Wed, 08 Jun 2022 07:13:18.509305000 UTC +00:00,  
 updated_at: Wed, 08 Jun 2022 07:13:18.509305000 UTC +00:00,  
 lock_version: 0,                                             
 email: "nan11@gmail.com",                                    
 name: "Nancy",                                               
 books_count: 0>

3.0.0 :104 > Book.all
  Book Load (0.5ms)  SELECT "books".* FROM "books"
 =>                                                         
[#<Book:0x0000559289b55ce0                                  
  id: 3,                                                    
  title: "Hindi",                                           
  author: nil,                                              
  created_at: Fri, 27 May 2022 08:27:48.661360000 UTC +00:00,
  updated_at: Fri, 27 May 2022 08:28:50.464697000 UTC +00:00,
  price: nil,                                               
  lock_version: 1,                                          
  author_id: nil>,                                          
 #<Book:0x0000559289b55c18                                  
  id: 4,                                                    
  title: "Mathematics",                                     
  author: nil,
  created_at: Mon, 06 Jun 2022 11:22:45.298692000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 11:22:45.298692000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000023>,
 #<Book:0x0000559289b55b50
  id: 5,
  title: "Mathematics",
  author: nil,
  created_at: Mon, 06 Jun 2022 11:24:59.699697000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 11:36:45.319017000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1000024>,
 #<Book:0x0000559289b55a88
  id: 6,
  title: nil,
  author: nil,
  created_at: Mon, 06 Jun 2022 12:10:38.521809000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 12:14:06.727076000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1>,
 #<Book:0x0000559289b559c0
  id: 7,
  title: nil,
  author: nil,
  created_at: Mon, 06 Jun 2022 13:25:09.703208000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 13:25:09.703208000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000028>,
 #<Book:0x0000559289b558f8
  id: 8,
  title: "bio",
  author: nil,
  created_at: Mon, 06 Jun 2022 13:28:24.587359000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 13:28:24.587359000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000028>,
 #<Book:0x0000559289b55830
  id: 9,
  title: "Biopic",
  author: nil,
  created_at: Tue, 07 Jun 2022 08:36:00.925894000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 08:36:00.925894000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000028>,
 #<Book:0x0000559289b55768
  id: 10,
  title: nil,
  author: nil,
  created_at: Tue, 07 Jun 2022 08:50:06.627354000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 08:50:06.627354000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000031>,
 #<Book:0x0000559289b556a0
  id: 11,
  title: nil,
  author: nil,
  created_at: Tue, 07 Jun 2022 09:18:30.811574000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 09:18:30.811574000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000032>,
 #<Book:0x0000559289b555d8
  id: 12,
  title: nil,
  author: nil,
  created_at: Tue, 07 Jun 2022 11:38:54.734148000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 11:38:54.734148000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000038>,
 #<Book:0x0000559289b55510
  id: 13,
  title: "Rails on ruby",
  author: nil,
  created_at: Tue, 07 Jun 2022 13:05:51.485908000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 13:15:32.204093000 UTC +00:00,
  price: nil,
  lock_version: 4,
  author_id: 1000039>,
 #<Book:0x0000559289b55448
  id: 14,
  title: "English",
  author: nil,
  created_at: Tue, 07 Jun 2022 13:44:27.938647000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 13:44:27.938647000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000041>,
 #<Book:0x0000559289b55380
  id: 15,
  title: nil,
  author: nil,
  created_at: Tue, 07 Jun 2022 13:47:52.996038000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 13:50:21.836392000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1000043>,
 #<Book:0x0000559289b552b8
  id: 16,
  title: nil,
  author: nil,
  created_at: Wed, 08 Jun 2022 07:01:07.135282000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:01:07.135282000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000044>,
 #<Book:0x0000559289b551f0
  id: 19,
  title: nil,
  author: nil,
  created_at: Wed, 08 Jun 2022 07:22:47.938790000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:23:31.599295000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1000046>,
 #<Book:0x0000559289b55128
  id: 18,
  title: nil,
  author: nil,
  created_at: Wed, 08 Jun 2022 07:18:08.037915000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:18:24.774880000 UTC +00:00,
  price: nil,
  lock_version: 2,
  author_id: nil>,
 #<Book:0x0000559289b55060
  id: 21,
  title: "Rails",
  author: nil,
  created_at: Wed, 08 Jun 2022 08:11:05.051500000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 08:11:05.051500000 UTC +00:00,
  price: 0.5e3,
  lock_version: 0,
  author_id: 1000045>] 
=end