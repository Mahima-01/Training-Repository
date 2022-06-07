class Book < ApplicationRecord
  belongs_to :author, touch: true
end

=begin
3.0.0 :001 > book2 = Book.new
 => #<Book:0x000056204ed3d820 id: nil, title: nil, author: nil, created_at: nil, updated_at: nil, price: nil, lock_version: 0, author_id: nil> 
3.0.0 :002 > book = book2.create_author(name: 'Mahima', email: 'mahima12@gmail.com')
  TRANSACTION (0.1ms)  BEGIN
  Author Create (0.4ms)  INSERT INTO "authors" ("created_at", "updated_at", "lock_version", "email", "name", "books_count") VALUES ($1, $2, $3, $4, $5, $6) RETURNING "id"  [["created_at", "2022-06-07 13:05:51.483214"], ["updated_at", "2022-06-07 13:05:51.483214"], ["lock_version", 0], ["email", "mahima12@gmail.com"], ["name", "Mahima"], ["books_count", 0]]
  Book Create (0.3ms)  INSERT INTO "books" ("title", "author", "created_at", "updated_at", "price", "lock_version", "author_id") VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING "id"  [["title", nil], ["author", nil], ["created_at", "2022-06-07 13:05:51.485908"], ["updated_at", "2022-06-07 13:05:51.485908"], ["price", nil], ["lock_version", 0], ["author_id", 1000039]]
  TRANSACTION (0.4ms)  COMMIT
 =>                         
#<Author:0x00007f80f04e1c40 

 => 
#<Book:0x00007f80f072c2c0                                                               
 id: 13,                                                                                
 title: nil,                                                                            
 author: nil,                                                                           
 created_at: Tue, 07 Jun 2022 13:05:51.485908000 UTC +00:00,                            
 updated_at: Tue, 07 Jun 2022 13:05:51.485908000 UTC +00:00,

 3.0.0 :011 > book.author
  Author Load (0.6ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" = $1 LIMIT $2  [["id", 1000039], ["LIMIT", 1]]
 =>                                                         
#<Author:0x00007f80f00d6100                                 
 id: 1000039,                                               
 created_at: Tue, 07 Jun 2022 13:05:51.483214000 UTC +00:00,
 updated_at: Tue, 07 Jun 2022 13:10:55.506937000 UTC +00:00,
3.0.0 :012 > book.title = "Rails on ruby"
 => "Rails on ruby"
 3.0.0 :013 > book.save
TRANSACTION (0.2ms)  BEGIN
Book Update (0.3ms)  UPDATE "books" SET "title" = $1, "updated_at" = $2, "lock_version" = $3 WHERE "books"."id" = $4 AND "books"."lock_version" = $5  [["title", "Rails on ruby"], ["updated_at", "2022-06-07 13:15:32.204093"], ["lock_version", 4], ["id", 13], ["lock_version", 3]]
Author Update (0.1ms)  UPDATE "authors" SET "updated_at" = $1, "lock_version" = $2 WHERE "authors"."id" = $3 AND "authors"."lock_version" = $4  [["updated_at", "2022-06-07 13:15:32.205807"], ["lock_version", 5], ["id", 1000039], ["lock_version", 4]]        
TRANSACTION (6.6ms)  COMMIT                                
 => true  
=end
