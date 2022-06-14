class Author < ApplicationRecord
  has_many :books
  has_many :categories
end

=begin
# Eager Loading:

Eager loading lets you preload the associated data (authors) for all the posts from the database, improves the overall performance by reducing the number of queries, 
and provides you with the data that you want to display in your views, but the only catch here is which one to use.
It mainly occurs when you load the bunch of objects and then for each object you make one 
more query to find associated object. N + 1 queries problem

The methods are:
includes
preload
eager_load

# includes:
3.0.0 :002 > Author.includes(:books, :categories)
  Author Load (45.6ms)  SELECT "authors".* FROM "authors"
  Book Load (0.8ms)  SELECT "books".* FROM "books" WHERE "books"."author_id" IN ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25)  [["author_id", 1000031], ["author_id", 1000032], ["author_id", 1000044], ["author_id", 1000033], ["author_id", 1000034], ["author_id", 1000048], ["author_id", 1000049], ["author_id", 1000050], ["author_id", 1000051], ["author_id", 1000035], ["author_id", 1000036], ["author_id", 1000037], ["author_id", 1000052], ["author_id", 1000038], ["author_id", 1000039], ["author_id", 1000040], ["author_id", 1000041], ["author_id", 1000042], ["author_id", 1000043], ["author_id", 1000025], ["author_id", 1000026], ["author_id", 1000027], ["author_id", 1000028], ["author_id", 1000029], ["author_id", 1000030]]                                                              
  Category Load (0.7ms)  SELECT "categories".* FROM "categories" WHERE "categories"."author_id" IN ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25)  [["author_id", 1000031], ["author_id", 1000032], ["author_id", 1000044], ["author_id", 1000033], ["author_id", 1000034], ["author_id", 1000048], ["author_id", 1000049], ["author_id", 1000050], ["author_id", 1000051], ["author_id", 1000035], ["author_id", 1000036], ["author_id", 1000037], ["author_id", 1000052], ["author_id", 1000038], ["author_id", 1000039], ["author_id", 1000040], ["author_id", 1000041], ["author_id", 1000042], ["author_id", 1000043], ["author_id", 1000025], ["author_id", 1000026], ["author_id", 1000027], ["author_id", 1000028], ["author_id", 1000029], ["author_id", 1000030]]                                           
 =>                                                                                            
[#<Author:0x000055e65279ef58
  id: 1000031,
  created_at: Tue, 07 Jun 2022 08:48:19.955330000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 08:48:19.955330000 UTC +00:00,
  lock_version: 2,
  email: "raj12@gmail.com",
  name: "Raj",
  books_count: 1>,
 #<Author:0x000055e65279de78
  id: 1000032,
  created_at: Tue, 07 Jun 2022 09:18:05.364907000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 09:18:05.364907000 UTC +00:00,
  lock_version: 2,
  email: "raj12@gmail.com",
  name: "Raj",
  books_count: 1>,
 #<Author:0x000055e65279d770
  id: 1000044,
  created_at: Wed, 08 Jun 2022 07:01:07.127119000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:01:07.127119000 UTC +00:00,
  lock_version: 0,
  email: "jane11@gmail.com",
  name: "Jane",
  books_count: 0>,
 #<Author:0x000055e65279cf50
  id: 1000033,
  created_at: Tue, 07 Jun 2022 09:26:08.934114000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 09:26:08.934114000 UTC +00:00,
  lock_version: 2,
  email: "raj12@gmail.com",
  name: "Raj",
  books_count: 0>,
 #<Author:0x000055e65279c8c0
  id: 1000034,
  created_at: Tue, 07 Jun 2022 09:27:09.593945000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 09:27:09.593945000 UTC +00:00,
  lock_version: 2,
  email: "raj12@gmail.com",
  name: "Raj",
  books_count: 0>,
 #<Author:0x000055e65279c1b8
  id: 1000048,
  created_at: Wed, 08 Jun 2022 07:22:47.937445000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:22:47.937445000 UTC +00:00,
  lock_version: 0,
  email: "mihir@gmail.com",
  name: "Mihir",
  books_count: 0>,
 #<Author:0x000055e652797aa0
  id: 1000049,
  created_at: Wed, 08 Jun 2022 07:26:37.512593000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:26:37.512593000 UTC +00:00,
  lock_version: 0,
  email: "mihir@gmail.com",
  name: "Mihir",
  books_count: 0>,
 #<Author:0x000055e652797230
  id: 1000050,
  created_at: Wed, 08 Jun 2022 07:29:03.097290000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 07:29:03.097290000 UTC +00:00,
  lock_version: 0,
  email: "nina@gmail.com",
  name: "Nina",
  books_count: 0>,
 #<Author:0x000055e652796b28
  id: 1000051,
  created_at: Wed, 08 Jun 2022 09:13:13.609441000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 09:13:13.609441000 UTC +00:00,
  lock_version: 0,
  email: nil,
  name: nil,
  books_count: 0>,
 #<Author:0x000055e6527965b0
  id: 1000035,
  created_at: Tue, 07 Jun 2022 11:34:57.471375000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 11:34:57.471375000 UTC +00:00,
  lock_version: 0,
  email: "raj12@gmail.com",
  name: "Raj",
  books_count: 0>,
 #<Author:0x000055e652796100
  id: 1000036,
  created_at: Tue, 07 Jun 2022 11:35:14.323123000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 11:35:14.323123000 UTC +00:00,
  lock_version: 0,
  email: "varun12@gmail.com",
  name: "Varun",
  books_count: 0>,
 #<Author:0x000055e652795688
  id: 1000037,
  created_at: Tue, 07 Jun 2022 11:36:19.914474000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 11:36:19.914474000 UTC +00:00,
  lock_version: 0,
  email: "varun12@gmail.com",
  name: "Varun",
  books_count: 0>,
 #<Author:0x000055e652794170
  id: 1000052,
  created_at: Wed, 08 Jun 2022 09:30:26.523067000 UTC +00:00,
  updated_at: Wed, 08 Jun 2022 09:30:26.523067000 UTC +00:00,
  lock_version: 0,
  email: nil,
  name: nil,
  books_count: 0>,
 #<Author:0x000055e65278fbe8
  id: 1000038,
  created_at: Tue, 07 Jun 2022 11:38:35.018134000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 11:38:35.018134000 UTC +00:00,
  lock_version: 0,
  email: "varun12@gmail.com",
  name: "Varun",
  books_count: 0>,
 #<Author:0x000055e65278f8f0
  id: 1000039,
  created_at: Tue, 07 Jun 2022 13:05:51.483214000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 13:15:32.205807000 UTC +00:00,
  lock_version: 5,
  email: "mahima12@gmail.com",
  name: "MAHIMA1",
  books_count: 0>,
 #<Author:0x000055e65278f3a0
  id: 1000040,
  created_at: Tue, 07 Jun 2022 13:42:37.915924000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 13:42:37.915924000 UTC +00:00,
  lock_version: 0,
  email: nil,
  name: nil,
  books_count: 0>,
 #<Author:0x000055e65278eec8
  id: 1000041,
  created_at: Tue, 07 Jun 2022 13:44:27.937099000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 13:44:27.937099000 UTC +00:00,
  lock_version: 0,
  email: "ram12@gmail.com",
  name: "Ram",
  books_count: 0>,
 #<Author:0x000055e65278e950
  id: 1000042,
  created_at: Tue, 07 Jun 2022 13:47:52.992899000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 13:47:52.992899000 UTC +00:00,
  lock_version: 0,
  email: "joe01@gmail.com",
  name: "Joel",
  books_count: 0>,
 #<Author:0x000055e65278e3d8
  id: 1000043,
  created_at: Tue, 07 Jun 2022 13:50:21.832953000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 13:50:21.832953000 UTC +00:00,
  lock_version: 0,
  email: "raju01@gmail.com",
  name: "Rajan",
  books_count: 0>,
 #<Author:0x000055e65278df28
  id: 1000025,
  created_at: Mon, 06 Jun 2022 11:45:17.961855000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 11:45:17.961855000 UTC +00:00,
  lock_version: 2,
  email: "joe12@gmail.com",
  name: "Joe",
  books_count: 0>,
 #<Author:0x000055e65278d988
  id: 1000026,
  created_at: Mon, 06 Jun 2022 11:53:31.518437000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 11:53:31.518437000 UTC +00:00,
  lock_version: 2,
  email: "joe12@gmail.com",
  name: "Joe",
  books_count: 0>,
 #<Author:0x000055e65278d168
  id: 1000027,
  created_at: Mon, 06 Jun 2022 12:02:11.380130000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 12:02:11.380130000 UTC +00:00,
  lock_version: 2,
  email: "joe12@gmail.com",
  name: "Joe",
  books_count: 0>,
 #<Author:0x000055e65278ccb8
  id: 1000028,
  created_at: Mon, 06 Jun 2022 13:22:52.066831000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 13:22:52.066831000 UTC +00:00,
  lock_version: 2,
  email: "joe12@gmail.com",
  name: "Joe",
  books_count: 3>,
 #<Author:0x000055e65278c740
  id: 1000029,
  created_at: Tue, 07 Jun 2022 07:48:33.736894000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 07:48:33.736894000 UTC +00:00,
  lock_version: 2,
  email: "joe12@gmail.com",
  name: "Joe",
  books_count: 0>,
 #<Author:0x000055e65278c1a0
  id: 1000030,
  created_at: Tue, 07 Jun 2022 07:49:57.701935000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 07:49:57.701935000 UTC +00:00,
  lock_version: 2,
  email: "joe12@gmail.com",
  name: "Joe",
  books_count: 0>] 

This will find the customer with id 1 and eager load all of the associated orders for it, 
the books for all of the orders, and the author and categories for each of the books.

3.0.0 :007 > Author.includes(books: [{ categories: { book: :title } }, :authors] ).find(1000050)
  Author Load (0.3ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" = $1 LIMIT $2  [["id", 1000050], ["LIMIT", 1]]
  Book Load (0.2ms)  SELECT "books".* FROM "books" WHERE "books"."author_id" = $1  [["author_id", 1000050]]
 =>                                                           
#<Author:0x000055e6524df060
 id: 1000050,
 created_at: Wed, 08 Jun 2022 07:29:03.097290000 UTC +00:00,
 updated_at: Wed, 08 Jun 2022 07:29:03.097290000 UTC +00:00,
 lock_version: 0,
 email: "nina@gmail.com",
 name: "Nina",
 books_count: 0> 

3.0.0 :011 > Author.includes(books: [{ categories: { book: :title } }, :authors] ).find(1000030)
  Author Load (0.4ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" = $1 LIMIT $2  [["id", 1000030], ["LIMIT", 1]]
  Book Load (0.2ms)  SELECT "books".* FROM "books" WHERE "books"."author_id" = $1  [["author_id", 1000030]]
 =>                                                  
#<Author:0x00007ff8ac144770
 id: 1000030,
 created_at: Tue, 07 Jun 2022 07:49:57.701935000 UTC +00:00,
 updated_at: Tue, 07 Jun 2022 07:49:57.701935000 UTC +00:00,
 lock_version: 2,
 email: "joe12@gmail.com",
 name: "Joe",
 books_count: 0> 

3.0.0 :022 > Author.includes(:books).where(books: { title: true })
  SQL (0.6ms)  SELECT "authors"."id" AS t0_r0, "authors"."created_at" AS t0_r1, "authors"."updated_at" AS t0_r2, 
  "authors"."lock_version" AS t0_r3, "authors"."email" AS t0_r4, 
  "authors"."name" AS t0_r5, "authors"."books_count" AS t0_r6, "books"."id" AS t1_r0, "books"."title" AS t1_r1, 
  "books"."author" AS t1_r2, "books"."created_at" AS t1_r3, "books"."updated_at" AS t1_r4, "books"."price" AS t1_r5, 
  "books"."lock_version" AS t1_r6, "books"."author_id" AS t1_r7 FROM "authors" LEFT OUTER JOIN "books" ON "books"."author_id" = "authors"."id" 
  WHERE "books"."title" = $1  [["title", "t"]]
 => []

# preload
With preload, Active Record loads each specified association using one query per association.
Revisiting the N + 1 queries problem, we could rewrite Book.limit(10) to preload authors:
3.0.0 :026 > books = Book.preload(:author).limit(3)
  Book Load (0.1ms)  SELECT "books".* FROM "books" LIMIT $1  [["LIMIT", 3]]
  Author Load (0.2ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" IN ($1, $2)  [["id", 1000023], ["id", 1000024]]
 => 
[#<Book:0x00007ff8aca99910
3.0.0 :027 > books
 => 
[#<Book:0x00007ff8aca99910
  id: 3,                 
  title: "Hindi",        
  author: nil,           
  created_at: Fri, 27 May 2022 08:27:48.661360000 UTC +00:00,
  updated_at: Fri, 27 May 2022 08:28:50.464697000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: nil>,
 #<Book:0x00007ff8aca99848
  id: 4,
  title: "Mathematics",
  author: nil,
  created_at: Mon, 06 Jun 2022 11:22:45.298692000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 11:22:45.298692000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000023>,
 #<Book:0x00007ff8aca99780
  id: 5,
  title: "Mathematics",
  author: nil,
  created_at: Mon, 06 Jun 2022 11:24:59.699697000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 11:36:45.319017000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1000024>] 

Note: The preload method uses an array, hash, or a nested hash of array/hash in the same way as the includes method to load any number of associations with a single Model.find call. 
However, unlike the includes method, it is not possible to specify conditions for preloaded associations.

# eager_load:
With eager_load, Active Record loads all specified associations using a LEFT OUTER JOIN.
3.0.0 :028 > books = Book.eager_load(:author).limit(10)
  SQL (0.4ms)  SELECT "books"."id" AS t0_r0, "books"."title" AS t0_r1, "books"."author" AS t0_r2, "books"."created_at" AS t0_r3, "books"."updated_at" AS t0_r4, "books"."price" AS t0_r5, "books"."lock_version" AS t0_r6, "books"."author_id" AS t0_r7, "authors"."id" AS t1_r0, "authors"."created_at" AS t1_r1, "authors"."updated_at" AS t1_r2, "authors"."lock_version" AS t1_r3, "authors"."email" AS t1_r4, "authors"."name" AS t1_r5, "authors"."books_count" AS t1_r6 FROM "books" LEFT OUTER JOIN "authors" ON "authors"."id" = "books"."author_id" LIMIT $1  [["LIMIT", 10]]
 => 
[#<Book:0x000055e652d0a730
3.0.0 :029 > books
 => 
[#<Book:0x000055e652d0a730
  id: 3,
  title: "Hindi",
  author: nil,
  created_at: Fri, 27 May 2022 08:27:48.661360000 UTC +00:00,
  updated_at: Fri, 27 May 2022 08:28:50.464697000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: nil>,
 #<Book:0x000055e652d0a3c0
  id: 4,
  title: "Mathematics",
  author: nil,
  created_at: Mon, 06 Jun 2022 11:22:45.298692000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 11:22:45.298692000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000023>,
 #<Book:0x000055e652d0a1e0
  id: 5,
  title: "Mathematics",
  author: nil,
  created_at: Mon, 06 Jun 2022 11:24:59.699697000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 11:36:45.319017000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1000024>,
 #<Book:0x000055e652d09fd8
  id: 6,
  title: nil,
  author: nil,
  created_at: Mon, 06 Jun 2022 12:10:38.521809000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 12:14:06.727076000 UTC +00:00,
  price: nil,
  lock_version: 1,
  author_id: 1>,
 #<Book:0x000055e652d09e48
  id: 7,
  title: nil,
  author: nil,
  created_at: Mon, 06 Jun 2022 13:25:09.703208000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 13:25:09.703208000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000028>,
 #<Book:0x000055e652d097e0
  id: 8,
  title: "bio",
  author: nil,
  created_at: Mon, 06 Jun 2022 13:28:24.587359000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 13:28:24.587359000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000028>,
 #<Book:0x000055e652d094e8
  id: 9,
  title: "Biopic",
  author: nil,
  created_at: Tue, 07 Jun 2022 08:36:00.925894000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 08:36:00.925894000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000028>,
 #<Book:0x000055e652d09268
  id: 10,
  title: nil,
  author: nil,
  created_at: Tue, 07 Jun 2022 08:50:06.627354000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 08:50:06.627354000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000031>,
 #<Book:0x000055e652d08f20
  id: 11,
  title: nil,
  author: nil,
  created_at: Tue, 07 Jun 2022 09:18:30.811574000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 09:18:30.811574000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000032>,
 #<Book:0x000055e652d08bd8
  id: 12,
  title: nil,
  author: nil,
  created_at: Tue, 07 Jun 2022 11:38:54.734148000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 11:38:54.734148000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000038>] 

=end
