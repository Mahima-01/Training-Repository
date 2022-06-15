class Book < ApplicationRecord
  #belongs_to :author
  #has_many :categories
  #scope :out_of_print, -> {where('id < 2 or id > 20') }
  #scope :out_of_title, -> { out_of_print.where("title = 'Programming'") }
  #scope :out_of_book_title, ->(title1) { where("title = ?", title1) }
  #scope :created_before, ->(time) { where("created_at < ?", time) }
  default_scope { where('id < 2 or id > 20')  }
end

=begin
# Scopes:
Scoping allows you to specify commonly-used queries which can be referenced as method calls on the association objects or models. 
With these scopes, you can use every method previously covered such as where, joins and includes. 
All scope bodies should return an ActiveRecord::Relation or nil to allow for further methods (such as other scopes) to be called on it.
To define a simple scope, we use the scope method inside the class, passing the query that we'd like to run when this scope is called.

3.0.0 :010 > Book.where('id > 0')
  Book Load (0.9ms)  SELECT "books".* FROM "books" WHERE (id > 0)
 =>                                                                               
[#<Book:0x0000557b24866d58                                                        
  id: 3,                                                                          
  title: "Hindi",                                                                 
  author: nil,                                                                    
  created_at: Fri, 27 May 2022 08:27:48.661360000 UTC +00:00,                     
  updated_at: Fri, 27 May 2022 08:28:50.464697000 UTC +00:00,                     
  price: nil,                                                                     
  lock_version: 1,                                                                
  author_id: nil>,
 #<Book:0x0000557b248fd5f0
  id: 4,
  title: "Mathematics",
  author: nil,
  created_at: Mon, 06 Jun 2022 11:22:45.298692000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 11:22:45.298692000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000023>,
 #<Book:0x0000557b248fd528
  id: 5,
  title: "Mathematics",
  author: nil,
  created_at: Mon, 06 Jun 2022 11:24:59.699697000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 11:36:45.319017000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1000024>,
 #<Book:0x0000557b248fd460
  id: 6,
  title: nil,
  author: nil,
  created_at: Mon, 06 Jun 2022 12:10:38.521809000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 12:14:06.727076000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1>,
 #<Book:0x0000557b248fd398
  id: 7,
  title: nil,
  author: nil,
  created_at: Mon, 06 Jun 2022 13:25:09.703208000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 13:25:09.703208000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000028>,
 #<Book:0x0000557b248fd2d0
  id: 8,
  title: "bio",
  author: nil,
  created_at: Mon, 06 Jun 2022 13:28:24.587359000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 13:28:24.587359000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000028>,
 #<Book:0x0000557b248fd208
  id: 9,
  title: "Biopic",
  author: nil,
  created_at: Tue, 07 Jun 2022 08:36:00.925894000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 08:36:00.925894000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000028>,
 #<Book:0x0000557b248fd140
  id: 10,
  title: nil,
  author: nil,
  created_at: Tue, 07 Jun 2022 08:50:06.627354000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 08:50:06.627354000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000031>,
 #<Book:0x0000557b248fd078
  id: 11,
  title: nil,
  author: nil,
  created_at: Tue, 07 Jun 2022 09:18:30.811574000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 09:18:30.811574000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000032>,
 #<Book:0x0000557b248fcfb0
  id: 12,
  title: nil,
  author: nil,
  created_at: Tue, 07 Jun 2022 11:38:54.734148000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 11:38:54.734148000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000038>,
 #<Book:0x0000557b248fcee8
  id: 13,
  title: "Rails on ruby",
  author: nil,
  created_at: Tue, 07 Jun 2022 13:05:51.485908000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 13:15:32.204093000 UTC +00:00,
  price: nil,
  lock_version: 4,
  author_id: 1000039>,
 #<Book:0x0000557b248fce20
  id: 14,
  title: "English",
  author: nil,
  created_at: Tue, 07 Jun 2022 13:44:27.938647000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 13:44:27.938647000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000041>,
 #<Book:0x0000557b248fcd58
  id: 15,
  title: nil,
  author: nil,
  created_at: Tue, 07 Jun 2022 13:47:52.996038000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 13:50:21.836392000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1000043>,
 #<Book:0x0000557b248fcc90
  id: 16,
  title: nil,
  author: nil,
  created_at: Wed, 08 Jun 2022 07:01:07.135282000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:01:07.135282000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000044>,
 #<Book:0x0000557b248fcbc8
  id: 19,
  title: nil,
  author: nil,
  created_at: Wed, 08 Jun 2022 07:22:47.938790000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:23:31.599295000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1000046>,
 #<Book:0x0000557b248fcb00
  id: 18,
  title: nil,
  author: nil,
  created_at: Wed, 08 Jun 2022 07:18:08.037915000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:18:24.774880000 UTC +00:00,
  price: nil,
  lock_version: 2,
  author_id: nil>,
 #<Book:0x0000557b248fca38
  id: 21,
  title: "Rails",
  author: nil,
  created_at: Wed, 08 Jun 2022 08:11:05.051500000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 08:11:05.051500000 UTC +00:00,
  price: 0.5e3,
  lock_version: 0,
  author_id: 1000045>,
 #<Book:0x0000557b248fc970
  id: 22,
  title: "Learning Ruby",
  author: nil,
  created_at: Wed, 08 Jun 2022 09:11:03.202795000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 09:11:03.202795000 UTC +00:00,
  price: 0.1e4,
  lock_version: 0,
  author_id: 1000046>,
 #<Book:0x0000557b248fc8a8
  id: 23,
  title: "Learning Ruby",
  author: nil,
  updated_at: Wed, 08 Jun 2022 09:13:13.610810000 UTC +00:00,
  price: 0.1e4,
3.0.0 :012 > Book.where('id < 2 or id > 20')
  Book Load (0.4ms)  SELECT "books".* FROM "books" WHERE (id < 2 or id > 20)
 =>                                                              
[#<Book:0x0000557b24756800                                       
  id: 21,                                                        
  title: "Rails",                                                
  author: nil,                                                   
  created_at: Wed, 08 Jun 2022 08:11:05.051500000 UTC +00:00,    
  updated_at: Wed, 08 Jun 2022 08:11:05.051500000 UTC +00:00,    
  price: 0.5e3,                                                  
  lock_version: 0,                                               
  author_id: 1000045>,                                           
 #<Book:0x0000557b24756738                                       
  id: 22,                                                        
  title: "Learning Ruby",                                        
  author: nil,
  created_at: Wed, 08 Jun 2022 09:11:03.202795000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 09:11:03.202795000 UTC +00:00,
  price: 0.1e4,
  lock_version: 0,
  author_id: 1000046>,
 #<Book:0x0000557b24756670
  id: 23,
  title: "Learning Ruby",
  author: nil,
  updated_at: Wed, 08 Jun 2022 09:13:13.610810000 UTC +00:00,
  lock_version: 0,

3.0.0 :001 > Book.out_of_print
  Book Load (0.4ms)  SELECT "books".* FROM "books" WHERE (id < 2 or id > 20)
 =>                                                         
[#<Book:0x000055dc00071fc0                                  
  id: 21,                                                   
  title: "Rails",                                           
  author: nil,                                              
  created_at: Wed, 08 Jun 2022 08:11:05.051500000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 08:11:05.051500000 UTC +00:00,
  price: 0.5e3,                                             
  lock_version: 0,                                          
  author_id: 1000045>,                                      
 #<Book:0x000055dc000cbb10                                  
  id: 22,                                                   
  title: "Learning Ruby",                                   
  author: nil,
  created_at: Wed, 08 Jun 2022 09:11:03.202795000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 09:11:03.202795000 UTC +00:00,
  price: 0.1e4,
  lock_version: 0,
  author_id: 1000046>,
 #<Book:0x000055dc000cba48
  id: 23,
  title: "Learning Ruby",
  author: nil,
  created_at: Wed, 08 Jun 2022 09:13:13.610810000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 09:13:13.610810000 UTC +00:00,
  price: 0.1e4,
  lock_version: 0,
  author_id: 1000051>,
 #<Book:0x000055dc000cb980
  id: 24,
  title: "Programming",
  author: nil,
  created_at: Wed, 08 Jun 2022 09:30:32.962006000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 09:30:32.962006000 UTC +00:00,
  price: 0.6e3,
  lock_version: 0,
  author_id: 1000052>] 

3.0.0 :002 > author = Author.first
  Author Load (7.4ms)  SELECT "authors".* FROM "authors" ORDER BY "authors"."id" ASC LIMIT $1  [["LIMIT", 1]]
 =>                                                                    
#<Author:0x000055dbff923d90  
3.0.0 :003 > author.books.out_of_print
  Book Load (0.4ms)  SELECT "books".* FROM "books" WHERE "books"."author_id" = $1 AND (id < 2 or id > 20)  [["author_id", 1000025]]
 => []

3.0.0 :001 > Book.out_of_title
  Book Load (0.6ms)  SELECT "books".* FROM "books" WHERE (id < 2 or id > 20) AND (title = 'Programming')
 =>                         
[#<Book:0x00007f21cca9e210  
  id: 24,                   
  title: "Programming",     
  author: nil,              
  created_at: Wed, 08 Jun 2022 09:30:32.962006000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 09:30:32.962006000 UTC +00:00,
  price: 0.6e3,             
  lock_version: 0,          
  author_id: 1000052>] 

3.0.0 :003 > Book.out_of_print.out_of_book_title('Hindi')
  Book Load (0.9ms)  SELECT "books".* FROM "books" WHERE (id < 2 or id > 20) AND (title = 'Hindi')
 => []                                                                      
3.0.0 :004 > Book.out_of_print.out_of_book_title('Programming')
  Book Load (0.8ms)  SELECT "books".* FROM "books" WHERE (id < 2 or id > 20) AND (title = 'Programming')
 =>                                                                         
[#<Book:0x0000563251771b70                                                  
  id: 24,                                                                   
  title: "Programming",                                                     
  author: nil,                                                              
  created_at: Wed, 08 Jun 2022 09:30:32.962006000 UTC +00:00,               
  updated_at: Wed, 08 Jun 2022 09:30:32.962006000 UTC +00:00,               
  price: 0.6e3,                                                             
  lock_version: 0,                                                          
  author_id: 1000052>] 
  
#  Passing in arguments
Your scope can take arguments:
3.0.0 :005 > Book.out_of_book_title('Programming')
  Book Load (0.7ms)  SELECT "books".* FROM "books" WHERE (title = 'Programming')
 =>                                                         
[#<Book:0x0000563251518428                                  
  id: 24,                                                   
  title: "Programming",                                     
  author: nil,                                              
  created_at: Wed, 08 Jun 2022 09:30:32.962006000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 09:30:32.962006000 UTC +00:00,
  price: 0.6e3,                                             
  lock_version: 0,                                          
  author_id: 1000052>]                                      
3.0.0 :006 > Book.out_of_book_title('Hindi')
  Book Load (0.6ms)  SELECT "books".* FROM "books" WHERE (title = 'Hindi')
 =>                                                         
[#<Book:0x000056325180a078
  id: 3,
  title: "Hindi",
  author: nil,
  created_at: Fri, 27 May 2022 08:27:48.661360000 UTC +00:00,
  updated_at: Fri, 27 May 2022 08:28:50.464697000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: nil>]

3.0.0 :007 > Book.out_of_book_title('Rails')
  Book Load (0.7ms)  SELECT "books".* FROM "books" WHERE (title = 'Rails')
 => 
[#<Book:0x0000563250d434a0
  id: 21,
  title: "Rails",
  author: nil,
  created_at: Wed, 08 Jun 2022 08:11:05.051500000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 08:11:05.051500000 UTC +00:00,
  price: 0.5e3,
  lock_version: 0,
  author_id: 1000045>]

# Using conditionals
Your scope can utilize conditionals:
3.0.0 :011 > Book.created_before('2021-06-15')
  Book Load (1.1ms)  SELECT "books".* FROM "books" WHERE (created_at < '2021-06-15')
 => [] 
3.0.0 :012 > Book.created_before('2022-06-11')
  Book Load (0.7ms)  SELECT "books".* FROM "books" WHERE (created_at < '2022-06-11')
 => 
[#<Book:0x0000561ec7f53b38
  id: 3,
  title: "Hindi",
  author: nil,
  created_at: Fri, 27 May 2022 08:27:48.661360000 UTC +00:00,
  updated_at: Fri, 27 May 2022 08:28:50.464697000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: nil>,
 #<Book:0x0000561ec7fb1b70
  id: 4,
  title: "Mathematics",
  author: nil,
  created_at: Mon, 06 Jun 2022 11:22:45.298692000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 11:22:45.298692000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000023>,
 #<Book:0x0000561ec7fb1aa8
  id: 5,
  title: "Mathematics",
  author: nil,
  created_at: Mon, 06 Jun 2022 11:24:59.699697000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 11:36:45.319017000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1000024>,
 #<Book:0x0000561ec7fb19e0
  id: 6,
  title: nil,
  author: nil,
  created_at: Mon, 06 Jun 2022 12:10:38.521809000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 12:14:06.727076000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1>,
 #<Book:0x0000561ec7fb1918
  id: 7,
  title: nil,
  author: nil,
  created_at: Mon, 06 Jun 2022 13:25:09.703208000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 13:25:09.703208000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000028>,
 #<Book:0x0000561ec7fb1850
  id: 8,
  title: "bio",
  author: nil,
  created_at: Mon, 06 Jun 2022 13:28:24.587359000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 13:28:24.587359000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000028>,
 #<Book:0x0000561ec7fb1788
  id: 9,
  title: "Biopic",
  author: nil,
  created_at: Tue, 07 Jun 2022 08:36:00.925894000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 08:36:00.925894000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000028>,
 #<Book:0x0000561ec7fb16c0
  id: 10,
  title: nil,
  author: nil,
  created_at: Tue, 07 Jun 2022 08:50:06.627354000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 08:50:06.627354000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000031>,
 #<Book:0x0000561ec7fb15f8
  id: 11,
  title: nil,
  author: nil,
  created_at: Tue, 07 Jun 2022 09:18:30.811574000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 09:18:30.811574000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000032>,
 #<Book:0x0000561ec7fb1530
  id: 12,
  title: nil,
  author: nil,
  created_at: Tue, 07 Jun 2022 11:38:54.734148000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 11:38:54.734148000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000038>,
 #<Book:0x0000561ec7fb1468
  id: 13,
  title: "Rails on ruby",
  author: nil,
  created_at: Tue, 07 Jun 2022 13:05:51.485908000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 13:15:32.204093000 UTC +00:00,
  price: nil,
  lock_version: 4,
  author_id: 1000039>,
 #<Book:0x0000561ec7fb13a0
  id: 14,
  title: "English",
  author: nil,
  created_at: Tue, 07 Jun 2022 13:44:27.938647000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 13:44:27.938647000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000041>,
 #<Book:0x0000561ec7fb12d8
  id: 15,
  title: nil,
  author: nil,
  created_at: Tue, 07 Jun 2022 13:47:52.996038000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 13:50:21.836392000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1000043>,
 #<Book:0x0000561ec7fb1210
  id: 16,
  title: nil,
  author: nil,
  created_at: Wed, 08 Jun 2022 07:01:07.135282000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:01:07.135282000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000044>,
 #<Book:0x0000561ec7fb1148
  id: 19,
  title: nil,
  author: nil,
  created_at: Wed, 08 Jun 2022 07:22:47.938790000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:23:31.599295000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1000046>,
 #<Book:0x0000561ec7fb1080
  id: 18,
  title: nil,
  author: nil,
  created_at: Wed, 08 Jun 2022 07:18:08.037915000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:18:24.774880000 UTC +00:00,
  price: nil,
  lock_version: 2,
  author_id: nil>,
 #<Book:0x0000561ec7fb0fb8
  id: 21,
  title: "Rails",
  author: nil,
  created_at: Wed, 08 Jun 2022 08:11:05.051500000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 08:11:05.051500000 UTC +00:00,
  price: 0.5e3,
  lock_version: 0,
  author_id: 1000045>,
 #<Book:0x0000561ec7fb0ef0
  id: 22,
  title: "Learning Ruby",
  author: nil,
  created_at: Wed, 08 Jun 2022 09:11:03.202795000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 09:11:03.202795000 UTC +00:00,
  price: 0.1e4,
  lock_version: 0,
  author_id: 1000046>,
 #<Book:0x0000561ec7fb0e28
  id: 23,
  title: "Learning Ruby",
  author: nil,
  created_at: Wed, 08 Jun 2022 09:13:13.610810000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 09:13:13.610810000 UTC +00:00,
  price: 0.1e4,
  lock_version: 0,
  author_id: 1000051>,
 #<Book:0x0000561ec7fb0d60
  id: 24,
  title: "Programming",
  author: nil,
  created_at: Wed, 08 Jun 2022 09:30:32.962006000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 09:30:32.962006000 UTC +00:00,
  price: 0.6e3,
  lock_version: 0,
  author_id: 1000052>] 

3.0.0 :016 > Book.created_before('2022-06-01')
  Book Load (0.6ms)  SELECT "books".* FROM "books" WHERE (created_at < '2022-06-01')
 => 
[#<Book:0x0000561ec87a2cf8
  id: 3,
  title: "Hindi",
  author: nil,
  created_at: Fri, 27 May 2022 08:27:48.661360000 UTC +00:00,
  updated_at: Fri, 27 May 2022 08:28:50.464697000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: nil>]

# Default Scope:
If we wish for a scope to be applied across all queries to the model we can use the default_scope method within the model itself.
In this we need not to write Book.default_scope instead we can write 'Book' as it will apply scope on the given model satisfying the condition.
3.0.0 :003 > Book.all
  Book Load (0.3ms)  SELECT "books".* FROM "books" WHERE (id < 2 or id > 20)
 =>                                                         
[#<Book:0x000055df13f22b08                                  
  id: 21,                                                   
  title: "Rails",                                           
  author: nil,                                              
  created_at: Wed, 08 Jun 2022 08:11:05.051500000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 08:11:05.051500000 UTC +00:00,
  price: 0.5e3,                                             
  lock_version: 0,                                          
  author_id: 1000045>,                                      
 #<Book:0x000055df13f80ac8                                  
  id: 22,                                                   
  title: "Learning Ruby",                                   
  author: nil,
  created_at: Wed, 08 Jun 2022 09:11:03.202795000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 09:11:03.202795000 UTC +00:00,
  price: 0.1e4,
  lock_version: 0,
  author_id: 1000046>,
 #<Book:0x000055df13f80a00
  id: 23,
  title: "Learning Ruby",
  author: nil,
  created_at: Wed, 08 Jun 2022 09:13:13.610810000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 09:13:13.610810000 UTC +00:00,
  price: 0.1e4,
  lock_version: 0,
  author_id: 1000051>,
 #<Book:0x000055df13f80938
  id: 24,
  title: "Programming",
  author: nil,
  created_at: Wed, 08 Jun 2022 09:30:32.962006000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 09:30:32.962006000 UTC +00:00,
  price: 0.6e3,
  lock_version: 0,
  author_id: 1000052>] 
=end