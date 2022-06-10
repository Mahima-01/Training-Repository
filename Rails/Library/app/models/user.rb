class User < ApplicationRecord
  has_many :students, class_name: "User", foreign_key: "teacher_id"

  belongs_to :teacher, class_name: "User", optional:true
end

=begin
# Find or Build a New Object:
It's common that you need to find a record or create it if it doesn't exist. 
You can do that with the find_or_create_by and find_or_create_by! methods.

find_or_create_by
The find_or_create_by method checks whether a record with the specified attributes exists. If it doesn't, then create is called.
3.0.0 :009 > student =  User.find_or_create_by(first_name: 'Andy')
  User Load (0.1ms)  SELECT "users".* FROM "users" WHERE "users"."first_name" = $1 LIMIT $2  [["first_name", "Andy"], ["LIMIT", 1]]
  TRANSACTION (0.1ms)  BEGIN                                                                   
  User Create (2.6ms)  INSERT INTO "users" ("first_name", "last_name", "created_at", "updated_at", "type", "teacher_id") VALUES ($1, $2, $3, $4, $5, $6) RETURNING "id"  [["first_name", "Andy"], ["last_name", nil], ["created_at", "2022-06-10 12:19:47.704230"], ["updated_at", "2022-06-10 12:19:47.704230"], ["type", nil], ["teacher_id", nil]]                                    
  TRANSACTION (0.3ms)  COMMIT                                          
 =>                                                                    
#<User:0x000056278b528858 
3.0.0 :010 > student
 => 
#<User:0x000056278b528858                                              
 id: 6,                                                                
 first_name: "Andy",                                                   
 last_name: nil,                                                       
 created_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
 updated_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
 type: nil,                             
 teacher_id: nil> 
find_or_create_by returns either the record that already exists or the new record. 
In our case, we didn't already have a user named Andy so the record is created and returned.

3.0.0 :011 > student =  User.find_or_create_by(first_name: 'Raman')
  User Load (0.2ms)  SELECT "users".* FROM "users" WHERE "users"."first_name" = $1 LIMIT $2  [["first_name", "Raman"], ["LIMIT", 1]]
  TRANSACTION (0.1ms)  BEGIN            
  User Create (0.2ms)  INSERT INTO "users" ("first_name", "last_name", "created_at", "updated_at", "type", "teacher_id") VALUES ($1, $2, $3, $4, $5, $6) RETURNING "id"  [["first_name", "Raman"], ["last_name", nil], ["created_at", "2022-06-10 12:20:16.397939"], ["updated_at", "2022-06-10 12:20:16.397939"], ["type", nil], ["teacher_id", nil]]    
  TRANSACTION (6.5ms)  COMMIT
 => 
#<User:0x00007fc79c35ae38

3.0.0 :012 > student
 => 
#<User:0x00007fc79c35ae38
 id: 7,
 first_name: "Raman",
 last_name: nil,
 created_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
 updated_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
 type: nil,
 teacher_id: nil> 


Suppose we want to set the 'locked' attribute to false if we're creating a new record, but we don't want to include it in the query. 
So we want to find the customer named "Andy", or if that user doesn't exist, create a user named "Andy" which is not locked.
The first way is using create:

3.0.0 :013 > student = User.create_with(locked: false).find_or_create_by(first_name: 'Andy')
  User Load (0.2ms)  SELECT "users".* FROM "users" WHERE "users"."first_name" = $1 LIMIT $2  [["first_name", "Andy"], ["LIMIT", 1]]
 =>                                     
#<User:0x000056278b853370  
3.0.0 :014 > student
 => 
#<User:0x000056278b853370               
 id: 6,                                 
 first_name: "Andy",                    
 last_name: nil,                        
 created_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
 updated_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
 type: nil,                             
 teacher_id: nil> 

The second way is using a block:
3.0.0 :015 > User.find_or_create_by(first_name: 'Andy') do |u|
3.0.0 :016 >   u.locked = false
3.0.0 :017 > end
  User Load (0.5ms)  SELECT "users".* FROM "users" WHERE "users"."first_name" = $1 LIMIT $2  [["first_name", "Andy"], ["LIMIT", 1]]
 =>                                                                       
#<User:0x00007fc79caacb50                                                 
 id: 6,                                                                   
 first_name: "Andy",                                                      
 last_name: nil,                                                          
 created_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,              
 updated_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,              
 type: nil,                                                               
 teacher_id: nil> 
The block will only be executed if the customer is being created. The second time we run this code, the block will be ignored.

# find_or_create_by!
You can also use find_or_create_by! to raise an exception if the new record is invalid.
3.0.0 :020 > student = User.find_or_create_by!(first_name: 'Aryan')
  User Load (0.3ms)  SELECT "users".* FROM "users" WHERE "users"."first_name" = $1 LIMIT $2  [["first_name", "Aryan"], ["LIMIT", 1]]
  TRANSACTION (0.1ms)  BEGIN
  User Create (0.2ms)  INSERT INTO "users" ("first_name", "last_name", "created_at", "updated_at", "type", "teacher_id") VALUES ($1, $2, $3, $4, $5, $6) RETURNING "id"  [["first_name", "Aryan"], ["last_name", nil], ["created_at", "2022-06-10 12:27:50.715381"], ["updated_at", "2022-06-10 12:27:50.715381"], ["type", nil], ["teacher_id", nil]]
  TRANSACTION (6.5ms)  COMMIT
 => 
#<User:0x000056278b3ab598

3.0.0 :021 > student
 => 
#<User:0x000056278b3ab598
 id: 8,
 first_name: "Aryan",
 last_name: nil,
 created_at: Fri, 10 Jun 2022 12:27:50.715381000 UTC +00:00,
 updated_at: Fri, 10 Jun 2022 12:27:50.715381000 UTC +00:00,
 type: nil,
 teacher_id: nil> 

# find_or_initialize_by
The find_or_initialize_by method will work just like find_or_create_by but it will call new instead of create. 
This means that a new model instance will be created in memory but won't be saved to the database.
3.0.0 :023 > nina = User.find_or_initialize_by(first_name: 'Nina')
  User Load (0.5ms)  SELECT "users".* FROM "users" WHERE "users"."first_name" = $1 LIMIT $2  [["first_name", "Nina"], ["LIMIT", 1]]
 => #<User:0x000056278ba39518 id: nil, first_name: "Nina", last_name: nil, created_at: nil, updated_at: nil, type: nil, teacher_id: nil> 
3.0.0 :024 > nina.persisted?
 => false 
3.0.0 :025 > nina.new_record?
 => true 

When you want to save it to the database, just call save:
3.0.0 :026 > nina.save
  TRANSACTION (0.3ms)  BEGIN
  User Create (0.6ms)  INSERT INTO "users" ("first_name", "last_name", "created_at", "updated_at", "type", "teacher_id") VALUES ($1, $2, $3, $4, $5, $6) RETURNING "id"  [["first_name", "Nina"], ["last_name", nil], ["created_at", "2022-06-10 12:31:35.940569"], ["updated_at", "2022-06-10 12:31:35.940569"], ["type", nil], ["teacher_id", nil]]                                              
  TRANSACTION (6.6ms)  COMMIT                                                    
 => true  

=end
