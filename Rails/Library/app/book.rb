class Book < ApplicationRecord
  belongs_to :author
end

=begin
association_changed?
The association_changed? method returns true if a new associated object has been assigned and the foreign key will be updated in the next save.
3.0.0 :043 > book2.author
 => 
#<Author:0x00007f83d8ef5a48
 id: 1000027,
 created_at: Mon, 06 Jun 2022 12:02:11.380130000 UTC +00:00,        
 updated_at: Mon, 06 Jun 2022 12:02:11.380130000 UTC +00:00,
 lock_version: 0,
 email: "joe12@gmail.com",
 name: "Joe">  
3.0.0 :044 > book2.author_changed?
 => true 
3.0.0 :046 > book2.author = Author.second
  Author Load (7.5ms)  SELECT "authors".* FROM "authors" ORDER BY "authors"."id" ASC LIMIT $1 OFFSET $2  [["LIMIT", 1], ["OFFSET", 1]]
 =>
#<Author:0x000056169a283be0     
3.0.0 :047 > book2.author_changed?
 => true 
3.0.0 :048 > book2.save!
  TRANSACTION (0.3ms)  BEGIN
  Book Create (0.3ms)  INSERT INTO "books" ("title", "author", "created_at", "updated_at", "price", "lock_version", "author_id") VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING "id"  [["title", nil], ["author", nil], ["created_at", "2022-06-06 12:10:38.521809"], ["updated_at", "2022-06-06 12:10:38.521809"], ["price", nil], ["lock_version", 0], ["author_id", 2]]
  TRANSACTION (6.6ms)  COMMIT
 => true   
3.0.0 :049 > book2.author_changed?
 => false 

 association_previously_changed?:
 The association_previously_changed? method returns true if the previous save updated the association to reference a new associate object.
3.0.0 :050 > book2.author
 => 
#<Author:0x000056169a283be0                                  
 id: 2,                                                      
 created_at: Thu, 26 May 2022 06:59:25.143651000 UTC +00:00, 
 updated_at: Thu, 26 May 2022 06:59:25.143651000 UTC +00:00, 
 lock_version: 0,                                
 email: nil,                                     
 name: nil> 
3.0.0 :051 > book2.author_previously_changed?
 => true 
3.0.0 :052 > book2.author = Author.first
  Author Load (0.1ms)  SELECT "authors".* FROM "authors" ORDER BY "authors"."id" ASC LIMIT $1  [["LIMIT", 1]]
 =>                                                                          
#<Author:0x00007f83d8416d98  
3.0.0 :053 > book2.save!
  TRANSACTION (0.4ms)  BEGIN
  Book Update (0.4ms)  UPDATE "books" SET "updated_at" = $1, "author_id" = $2, "lock_version" = $3 WHERE "books"."id" = $4 AND "books"."lock_version" = $5  [["updated_at", "2022-06-06 12:14:06.727076"], ["author_id", 1], ["lock_version", 1], ["id", 6], ["lock_version", 0]]
  TRANSACTION (6.8ms)  COMMIT                                                
 => true                                                                     
3.0.0 :054 > book2.author_previously_changed?
 => true 
=end