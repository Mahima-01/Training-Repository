class Book < ApplicationRecord
  after_destroy :log_destroy_action

  def log_destroy_action
    puts 'Article destroyed'
  end
end

=begin
#  Relational Callbacks
Callbacks work through model relationships, and can even be defined by them. Suppose an example where a user has many articles. A user's articles should be destroyed if the user is destroyed. Let's add an after_destroy callback to the User model by way of its relationship to the Article model:
3.0.0 :001 > user = User.first
  User Load (0.2ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT $1  [["LIMIT", 1]]
 =>                                                                
#<User:0x0000564b379d5c28
3.0.0 :002 > user
 => 
#<User:0x0000564b379d5c28                                          
 id: 1,                                                            
 first_name: "Mary",                                               
 last_name: nil,                                                   
 created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,       
 updated_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,       
 type: nil,                                                        
 teacher_id: nil,                                                  
 login: nil,
 email: nil> 

3.0.0 :015 > author.save
  TRANSACTION (0.3ms)  BEGIN
  Author Create (9.2ms)  INSERT INTO "authors" ("created_at", "updated_at", "lock_version", "email", "name", "books_count") VALUES ($1, $2, $3, $4, $5, $6) RETURNING "id"  [["created_at", "2022-06-21 13:37:07.430621"], ["updated_at", "2022-06-21 13:37:07.430621"], ["lock_version", 0], ["email", nil], ["name", nil], ["books_count", 0]]                                                     
  TRANSACTION (0.6ms)  COMMIT                                                      
 => true  

3.0.0 :016 > author.books.create!
  TRANSACTION (0.1ms)  BEGIN
  Book Create (0.6ms)  INSERT INTO "books" ("title", "author", "created_at", "updated_at", "price", "lock_version", "author_id") VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING "id"  [["title", nil], ["author", nil], ["created_at", "2022-06-21 13:37:26.652119"], ["updated_at", "2022-06-21 13:37:26.652119"], ["price", nil], ["lock_version", 0], ["author_id", 1000053]] 
  TRANSACTION (0.4ms)  COMMIT                                 
 =>                                                           
#<Book:0x0000564b3a754758                         
 id: 25,                                          
 title: nil,                                      
 author: nil,                                     
 created_at: Tue, 21 Jun 2022 13:37:26.652119000 UTC +00:00,
 updated_at: Tue, 21 Jun 2022 13:37:26.652119000 UTC +00:00,
 price: nil,                                      
 lock_version: 0,                                 
 author_id: 1000053>

3.0.0 :017 > author.destroy
  TRANSACTION (0.1ms)  BEGIN
  Book Load (0.2ms)  SELECT "books".* FROM "books" WHERE "books"."author_id" = $1  [["author_id", 1000053]]
  Book Destroy (0.2ms)  DELETE FROM "books" WHERE "books"."id" = $1 AND "books"."lock_version" = $2  [["id", 25], ["lock_version", 0]]
Article destroyed                                                                  
  Author Destroy (0.3ms)  DELETE FROM "authors" WHERE "authors"."id" = $1 AND "authors"."lock_version" = $2  [["id", 1000053], ["lock_version", 0]]
  TRANSACTION (6.6ms)  COMMIT                                                      
 =>                                                                                
#<Author:0x0000564b39df4d20                                                        
 id: 1000053,                                                                      
 created_at: Tue, 21 Jun 2022 13:37:07.430621000 UTC +00:00,                       
 updated_at: Tue, 21 Jun 2022 13:37:07.430621000 UTC +00:00,                       
 lock_version: 0,                                                                  
 email: nil,                                                                       
 name: nil,                                                                        
 books_count: 0> 
 
=end