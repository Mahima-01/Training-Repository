class Author < ApplicationRecord
  has_many :books
  has_many :categories
end

=begin
# Joins:
Active Record provides two finder methods for specifying JOIN clauses on the resulting SQL: joins and left_outer_joins. 
While joins should be used for INNER JOIN or custom queries, left_outer_joins is used for queries using LEFT OUTER JOIN.

#  Using Array/Hash of Named Associations:
3.0.0 :001 > Author.joins(:books)
  Author Load (9.1ms)  SELECT "authors".* FROM "authors" INNER JOIN "books" ON "books"."author_id" = "authors"."id"
 =>                                                                                                                                            
[#<Author:0x00007f484c435ad0                                                                                                                   
  id: 1000028,                                                                                                                                 
  created_at: Mon, 06 Jun 2022 13:22:52.066831000 UTC +00:00,                                                                                  
  updated_at: Mon, 06 Jun 2022 13:22:52.066831000 UTC +00:00,                                                                                  
  lock_version: 2,                                                                                                                             
  email: "joe12@gmail.com",                                                                                                                    
  name: "Joe",                                                                                                                                 
  books_count: 3>,                                                                  
 #<Author:0x00007f484c6251d8                                                        
  id: 1000028,                                                                      
  created_at: Mon, 06 Jun 2022 13:22:52.066831000 UTC +00:00,                       
  updated_at: Mon, 06 Jun 2022 13:22:52.066831000 UTC +00:00,                       
  lock_version: 2,                                                                  
  email: "joe12@gmail.com",
  name: "Joe",
  books_count: 3>,
 #<Author:0x00007f484c625110
  id: 1000028,
  created_at: Mon, 06 Jun 2022 13:22:52.066831000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 13:22:52.066831000 UTC +00:00,
  lock_version: 2,
  email: "joe12@gmail.com",
  name: "Joe",
  books_count: 3>,
 #<Author:0x00007f484c625048
  id: 1000031,
  created_at: Tue, 07 Jun 2022 08:48:19.955330000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 08:48:19.955330000 UTC +00:00,
  lock_version: 2,
  email: "raj12@gmail.com",
  name: "Raj",
  books_count: 1>,
 #<Author:0x00007f484c624f80
  id: 1000032,
  created_at: Tue, 07 Jun 2022 09:18:05.364907000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 09:18:05.364907000 UTC +00:00,
  lock_version: 2,
  email: "raj12@gmail.com",
  name: "Raj",
  books_count: 1>,
 #<Author:0x00007f484c61ff30
  id: 1000038,
  created_at: Tue, 07 Jun 2022 11:38:35.018134000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 11:38:35.018134000 UTC +00:00,
  lock_version: 0,
  email: "varun12@gmail.com",
  name: "Varun",
  books_count: 0>,
 #<Author:0x00007f484c61fe68
  id: 1000039,
  created_at: Tue, 07 Jun 2022 13:05:51.483214000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 13:15:32.205807000 UTC +00:00,
  lock_version: 5,
  email: "mahima12@gmail.com",
  name: "MAHIMA1",
  books_count: 0>,
 #<Author:0x00007f484c61fda0
  id: 1000041,
  created_at: Tue, 07 Jun 2022 13:44:27.937099000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 13:44:27.937099000 UTC +00:00,
  lock_version: 0,
  email: "ram12@gmail.com",
  name: "Ram",
  books_count: 0>,
 #<Author:0x00007f484c61fcd8
  id: 1000043,
  created_at: Tue, 07 Jun 2022 13:50:21.832953000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 13:50:21.832953000 UTC +00:00,
  lock_version: 0,
  email: "raju01@gmail.com",
  name: "Rajan",
  books_count: 0>,
 #<Author:0x00007f484c61fbe8
  id: 1000044,
  created_at: Wed, 08 Jun 2022 07:01:07.127119000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:01:07.127119000 UTC +00:00,
  lock_version: 0,
  email: "jane11@gmail.com",
  name: "Jane",
  books_count: 0>,
 #<Author:0x00007f484c61fb20
  id: 1000051,
  created_at: Wed, 08 Jun 2022 09:13:13.609441000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 09:13:13.609441000 UTC +00:00,
  lock_version: 0,
  email: nil,
  name: nil,
  books_count: 0>,
 #<Author:0x00007f484c61fa58
  id: 1000052,
  created_at: Wed, 08 Jun 2022 09:30:26.523067000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 09:30:26.523067000 UTC +00:00,
  lock_version: 0,
  email: nil,
  name: nil,
  books_count: 0>] 

#  Joining Multiple Associations:
3.0.0 :001 > Author.joins(:books, :categories)
  Author Load (7.0ms)  SELECT "authors".* FROM "authors" INNER JOIN "books" ON "books"."author_id" = "authors"."id" INNER JOIN "categories" ON "categories"."author_id" = "authors"."id"
 => [] 

# Joining Nested Associations (Single Level):
3.0.0 :003 > Author.joins(books: :categories)
  Author Load (0.6ms)  SELECT "authors".* FROM "authors" INNER JOIN "books" ON "books"."author_id" = "authors"."id" INNER JOIN "categories" ON "categories"."book_id" = "books"."id"                                                    
 => [] 

# Joining Nested Associations (Multiple Level):
3.0.0 :002 > Author.joins(books: [{ categories: :posts }] )
  Author Load (7.0ms)  SELECT "authors".* FROM "authors" INNER JOIN "books" ON "books"."author_id" = "authors"."id" INNER JOIN "categories" ON "categories"."book_id" = "books"."id" INNER JOIN "posts" ON "posts"."category_id" = "categories"."id"                                                              
 => []  

# Left Outer Join:
 Left Outer Join retrieves all the rows from both the tables that satisfy the join condition along with the unmatched rows of the left table.
3.0.0 :003 > Author.left_outer_joins(:categories)
  Author Load (64.5ms)  SELECT "authors".* FROM "authors" LEFT OUTER JOIN "categories" ON "categories"."author_id" = "authors"."id"
 =>                                                                                                                                                      
[#<Author:0x00007fd640520648                                                                                                                             
  id: 1000031,                                                                                                                                           
  created_at: Tue, 07 Jun 2022 08:48:19.955330000 UTC +00:00,                                                                                            
  updated_at: Tue, 07 Jun 2022 08:48:19.955330000 UTC +00:00,                                                                       
  lock_version: 2,                                                                                                                  
  email: "raj12@gmail.com",                                                                                                         
  name: "Raj",                                                                                                     
  books_count: 1>,                                                                                                 
 #<Author:0x00007fd640777130                                                                                       
  id: 1000032,                                                                                 
  created_at: Tue, 07 Jun 2022 09:18:05.364907000 UTC +00:00,                                  
  updated_at: Tue, 07 Jun 2022 09:18:05.364907000 UTC +00:00,                                  
  lock_version: 2,                                                                             
  email: "raj12@gmail.com",
  name: "Raj",
  books_count: 1>,
 #<Author:0x00007fd640777040
  id: 1000044,
  created_at: Wed, 08 Jun 2022 07:01:07.127119000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:01:07.127119000 UTC +00:00,
  lock_version: 0,
  email: "jane11@gmail.com",
  name: "Jane",
  books_count: 0>,
 #<Author:0x00007fd640776f50
  id: 1000033,
  created_at: Tue, 07 Jun 2022 09:26:08.934114000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 09:26:08.934114000 UTC +00:00,
  lock_version: 2,
  email: "raj12@gmail.com",
  name: "Raj",
  books_count: 0>,
 #<Author:0x00007fd640776e88
  id: 1000034,
  created_at: Tue, 07 Jun 2022 09:27:09.593945000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 09:27:09.593945000 UTC +00:00,
  lock_version: 2,
  email: "raj12@gmail.com",
  name: "Raj",
  books_count: 0>,
 #<Author:0x00007fd640776d98
  id: 1000048,
  created_at: Wed, 08 Jun 2022 07:22:47.937445000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:22:47.937445000 UTC +00:00,
  lock_version: 0,
  email: "mihir@gmail.com",
  name: "Mihir",
  books_count: 0>,
 #<Author:0x00007fd640776ca8
  id: 1000049,
  created_at: Wed, 08 Jun 2022 07:26:37.512593000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:26:37.512593000 UTC +00:00,
  lock_version: 0,
  email: "mihir@gmail.com",
  name: "Mihir",
  books_count: 0>,
 #<Author:0x00007fd640776bb8
  id: 1000050,
  created_at: Wed, 08 Jun 2022 07:29:03.097290000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:29:03.097290000 UTC +00:00,
  lock_version: 0,
  email: "nina@gmail.com",
  name: "Nina",
  books_count: 0>,
 #<Author:0x00007fd640776ac8
  id: 1000051,
  created_at: Wed, 08 Jun 2022 09:13:13.609441000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 09:13:13.609441000 UTC +00:00,
  lock_version: 0,
  email: nil,
  name: nil,
  books_count: 0>,
 #<Author:0x00007fd6407769d8
  id: 1000035,
  created_at: Tue, 07 Jun 2022 11:34:57.471375000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 11:34:57.471375000 UTC +00:00,
  lock_version: 0,
  email: "raj12@gmail.com",
  name: "Raj",
  books_count: 0>,
 #<Author:0x00007fd640776910
  id: 1000036,
  created_at: Tue, 07 Jun 2022 11:35:14.323123000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 11:35:14.323123000 UTC +00:00,
  lock_version: 0,
  email: "varun12@gmail.com",
  name: "Varun",
  books_count: 0>,
 #<Author:0x00007fd640776820
  id: 1000037,
  created_at: Tue, 07 Jun 2022 11:36:19.914474000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 11:36:19.914474000 UTC +00:00,
  lock_version: 0,
  email: "varun12@gmail.com",
  name: "Varun",
  books_count: 0>,
 #<Author:0x00007fd640776730
  id: 1000052,
  created_at: Wed, 08 Jun 2022 09:30:26.523067000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 09:30:26.523067000 UTC +00:00,
  lock_version: 0,
  email: nil,
  name: nil,
  books_count: 0>,
 #<Author:0x00007fd640776640
  id: 1000038,
  created_at: Tue, 07 Jun 2022 11:38:35.018134000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 11:38:35.018134000 UTC +00:00,
  lock_version: 0,
  email: "varun12@gmail.com",
  name: "Varun",
  books_count: 0>,
 #<Author:0x00007fd640776550
  id: 1000039,
  created_at: Tue, 07 Jun 2022 13:05:51.483214000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 13:15:32.205807000 UTC +00:00,
  lock_version: 5,
  email: "mahima12@gmail.com",
  name: "MAHIMA1",
  books_count: 0>,
 #<Author:0x00007fd640776460
  id: 1000040,
  created_at: Tue, 07 Jun 2022 13:42:37.915924000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 13:42:37.915924000 UTC +00:00,
  lock_version: 0,
  email: nil,
  name: nil,
  books_count: 0>,
 #<Author:0x00007fd640776398
  id: 1000041,
  created_at: Tue, 07 Jun 2022 13:44:27.937099000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 13:44:27.937099000 UTC +00:00,
  lock_version: 0,
  email: "ram12@gmail.com",
  name: "Ram",
  books_count: 0>,
 #<Author:0x00007fd6407762a8
  id: 1000042,
  created_at: Tue, 07 Jun 2022 13:47:52.992899000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 13:47:52.992899000 UTC +00:00,
  lock_version: 0,
  email: "joe01@gmail.com",
  name: "Joel",
  books_count: 0>,
 #<Author:0x00007fd6407761b8
  id: 1000043,
  created_at: Tue, 07 Jun 2022 13:50:21.832953000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 13:50:21.832953000 UTC +00:00,
  lock_version: 0,
  email: "raju01@gmail.com",
  name: "Rajan",
  books_count: 0>,
 #<Author:0x00007fd6407760c8
  id: 1000025,
  created_at: Mon, 06 Jun 2022 11:45:17.961855000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 11:45:17.961855000 UTC +00:00,
  lock_version: 2,
  email: "joe12@gmail.com",
  name: "Joe",
  books_count: 0>,
 #<Author:0x00007fd640775fd8
  id: 1000026,
  created_at: Mon, 06 Jun 2022 11:53:31.518437000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 11:53:31.518437000 UTC +00:00,
  lock_version: 2,
  email: "joe12@gmail.com",
  name: "Joe",
  books_count: 0>,
 #<Author:0x00007fd640775ee8
  id: 1000027,
  created_at: Mon, 06 Jun 2022 12:02:11.380130000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 12:02:11.380130000 UTC +00:00,
  lock_version: 2,
  email: "joe12@gmail.com",
  name: "Joe",
  books_count: 0>,
 #<Author:0x00007fd640775e20
  id: 1000028,
  created_at: Mon, 06 Jun 2022 13:22:52.066831000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 13:22:52.066831000 UTC +00:00,
  lock_version: 2,
  email: "joe12@gmail.com",
  name: "Joe",
  books_count: 3>,
 #<Author:0x00007fd640775d30
  id: 1000029,
  created_at: Tue, 07 Jun 2022 07:48:33.736894000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 07:48:33.736894000 UTC +00:00,
  lock_version: 2,
  email: "joe12@gmail.com",
  name: "Joe",
  books_count: 0>,
 #<Author:0x00007fd640775c40
  id: 1000030,
  created_at: Tue, 07 Jun 2022 07:49:57.701935000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 07:49:57.701935000 UTC +00:00,
  lock_version: 2,
  email: "joe12@gmail.com",
  name: "Joe",
  books_count: 0>] 
=end
