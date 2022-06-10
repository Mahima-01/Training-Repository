class User < ApplicationRecord
  has_many :students, class_name: "User", foreign_key: "teacher_id"

  belongs_to :teacher, class_name: "User", optional:true
end

=begin
# Retrieving a Single Object
Active Record provides several different ways of retrieving a single object.
#  find:
Using the find method, you can retrieve the object corresponding to the specified primary key that matches any supplied options. 
3.0.0 :001 > user = User.new
 => #<User:0x000055bfbe77c5a8 id: nil, first_name: nil, last_name: nil, created_at: nil, updated_at: nil, type: nil, teacher_id: nil> 
3.0.0 :003 > student = User.find(3)
  User Load (0.8ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 3], ["LIMIT", 1]]
 =>                                                 
#<Admin:0x000055bfbe9a1e78 
3.0.0 :004 > student
 => 
#<Admin:0x000055bfbe9a1e78                          
 id: 3,                                             
 first_name: "Mridula",                             
 last_name: nil,                                    
 created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
 updated_at: Thu, 09 Jun 2022 14:32:46.658374000 UTC +00:00,
 type: "Admin",                                     
 teacher_id: 4> 

The find method will raise an ActiveRecord::RecordNotFound exception if no matching record is found.
3.0.0 :005 > student = User.find(8)
  User Load (0.5ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 8], ["LIMIT", 1]]
/home/itsacheckmate/.rvm/gems/ruby-3.0.0/gems/activerecord-7.0.3/lib/active_record/core.rb:284:in `find': Couldn't find User with 'id'=8 (ActiveRecord::RecordNotFound) 

You can also use this method to query for multiple objects. Call the find method and pass in an array of primary keys. 
The return will be an array containing all of the matching records for the supplied primary keys
3.0.0 :006 > student = User.find(2,3)
  User Load (0.3ms)  SELECT "users".* FROM "users" WHERE "users"."id" IN ($1, $2)  [["id", 2], ["id", 3]]
 => 
[#<Reader:0x000055bfbd6f92a8
3.0.0 :007 > student
 => 
[#<Reader:0x000055bfbd6f92a8                                
  id: 2,                                                    
  first_name: "Mridul",                                     
  last_name: nil,                                           
  created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:19:26.000191000 UTC +00:00,
  type: "Reader",                                           
  teacher_id: 1>,                                           
 #<Admin:0x00007fc3200a01f0                                 
  id: 3,                                                    
  first_name: "Mridula",                                    
  last_name: nil,                                           
  created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:32:46.658374000 UTC +00:00,
  type: "Admin",                                            
  teacher_id: 4>] 

#  take:
The take method retrieves a record without any implicit ordering.
3.0.0 :008 > student = User.take
  User Load (0.1ms)  SELECT "users".* FROM "users" LIMIT $1  [["LIMIT", 1]]
 =>                                                                   
#<User:0x00007fc320457f78  
3.0.0 :009 > student
 => 
#<User:0x00007fc320457f78                                             
 id: 1,                                                               
 first_name: "Mary",                                                  
 last_name: nil,                                                      
 created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,          
 updated_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,          
 type: nil,                                                           
 teacher_id: nil>  

The take method returns nil if no record is found and no exception will be raised.

You can pass in a numerical argument to the take method to return up to that number of results.
3.0.0 :012 > student = User.take(2)
  User Load (0.2ms)  SELECT "users".* FROM "users" LIMIT $1  [["LIMIT", 2]]
 => 
[#<User:0x00007fc3209ebed0
3.0.0 :013 > student
 => 
[#<User:0x00007fc3209ebed0
  id: 1,
  first_name: "Mary",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<Reader:0x00007fc3209ebdb8
  id: 4,
  first_name: "Manu",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  type: "Reader",
  teacher_id: nil>] 

3.0.0 :014 > student = User.take(4)
  User Load (0.5ms)  SELECT "users".* FROM "users" LIMIT $1  [["LIMIT", 4]]
 => 
[#<User:0x000055bfbe865d20
  3.0.0 :015 > student
 => 
[#<User:0x000055bfbe865d20                                  
  id: 1,                                                    
  first_name: "Mary",                                       
  last_name: nil,                                           
  created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
  type: nil,                                                
  teacher_id: nil>,                                         
 #<Reader:0x000055bfbe865c08                                
  id: 4,                                                    
  first_name: "Manu",                                       
  last_name: nil,                                           
  created_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  type: "Reader",                                           
  teacher_id: nil>,                                         
 #<Reader:0x000055bfbe865af0                                
  id: 2,                                                    
  first_name: "Mridul",                                     
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:19:26.000191000 UTC +00:00,
  type: "Reader",
  teacher_id: 1>,
 #<User:0x000055bfbe865a00
  id: 5,
  first_name: "Mahima",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,
  type: nil,
  teacher_id: 7>] 

The take! method behaves exactly like take, except that it will raise ActiveRecord::RecordNotFound if no matching record is found.
3.0.0 :016 > student = User.take!
  User Load (0.2ms)  SELECT "users".* FROM "users" LIMIT $1  [["LIMIT", 1]]
 =>                              
#<User:0x000055bfbe8a5150
3.0.0 :017 > student
 => 
#<User:0x000055bfbe8a5150
 id: 1,
 first_name: "Mary",
 last_name: nil,
 created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
 updated_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
 type: nil,
 teacher_id: nil>

#  first:
The first method finds the first record ordered by primary key (default).
3.0.0 :018 > student = User.first
  User Load (0.2ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT $1  [["LIMIT", 1]]
 =>                                                                   
#<User:0x000055bfbeb035c8 
3.0.0 :019 > student
 => 
#<User:0x000055bfbeb035c8                                             
 id: 1,                                                               
 first_name: "Mary",                                                  
 last_name: nil,                                                      
 created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,          
 updated_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,          
 type: nil,                                                           
 teacher_id: nil> 

If your default scope contains an order method, first will return the first record according to this ordering.

You can pass in a numerical argument to the first method to return up to that number of results.
3.0.0 :020 > student = User.first(3)
  User Load (0.2ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT $1  [["LIMIT", 3]]
 =>                                            
[#<User:0x000055bfbdfebac8 
3.0.0 :021 > student
 => 
[#<User:0x000055bfbdfebac8
  id: 1,
  first_name: "Mary",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<Reader:0x000055bfbdfeb9b0
  id: 2,
  first_name: "Mridul",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:19:26.000191000 UTC +00:00,
  type: "Reader",
  teacher_id: 1>,
 #<Admin:0x000055bfbdfeb898
  id: 3,
  first_name: "Mridula",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:32:46.658374000 UTC +00:00,
  type: "Admin",
  teacher_id: 4>] 

The first! method behaves exactly like first, except that it will raise ActiveRecord::RecordNotFound if no matching record is found.
3.0.0 :022 > student = User.first!
  User Load (0.3ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT $1  [["LIMIT", 1]]
 =>                                            
#<User:0x00007fc320a4a2c8 
3.0.0 :023 > student
 => 
#<User:0x00007fc320a4a2c8
 id: 1,
 first_name: "Mary",
 last_name: nil,
 created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
 updated_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
 type: nil,
 teacher_id: nil> 

# last:
The last method finds the last record ordered by primary key (default).
3.0.0 :024 > student = User.last
  User Load (0.1ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" DESC LIMIT $1  [["LIMIT", 1]]
 =>                                                                   
#<User:0x00007fc32077ee40 
3.0.0 :025 > student
 => 
#<User:0x00007fc32077ee40                                             
 id: 5,                                                               
 first_name: "Mahima",                                                
 last_name: nil,                                                      
 created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,          
 updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,          
 type: nil,                                                           
 teacher_id: 7> 

You can pass in a numerical argument to the last method to return up to that number of results.
3.0.0 :026 > student = User.last(2)
  User Load (0.3ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" DESC LIMIT $1  [["LIMIT", 2]]
 =>                              
[#<Reader:0x00007fc320b1e4d8
... 
3.0.0 :027 > student
 => 
[#<Reader:0x00007fc320b1e4d8
  id: 4,
  first_name: "Manu",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  type: "Reader",
  teacher_id: nil>,
 #<User:0x00007fc320b1e5f0
  id: 5,
  first_name: "Mahima",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,
  type: nil,
  teacher_id: 7>] 

3.0.0 :028 > student = User.last!
  User Load (0.5ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" DESC LIMIT $1  [["LIMIT", 1]]
 =>                              
#<User:0x000055bfbea1cb78
... 
3.0.0 :029 > student
 => 
#<User:0x000055bfbea1cb78
 id: 5,
 first_name: "Mahima",
 last_name: nil,
 created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,
 updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,
 type: nil,
 teacher_id: 7> 

3.0.0 :030 > student = User.order(:first_name).last
  User Load (0.7ms)  SELECT "users".* FROM "users" ORDER BY "users"."first_name" DESC LIMIT $1  [["LIMIT", 1]]
 =>                                                                                         
#<Admin:0x000055bfbe945bf0                                                                  
...                                                                                         
3.0.0 :031 > student
 => 
#<Admin:0x000055bfbe945bf0                                                                  
 id: 3,                                                                                     
 first_name: "Mridula",                                                                     
 last_name: nil,                                                                            
 created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,                                
 updated_at: Thu, 09 Jun 2022 14:32:46.658374000 UTC +00:00,                                
 type: "Admin",                                                                             
 teacher_id: 4> 

# find_by:
The find_by method finds the first record matching some conditions.
3.0.0 :033 > student = User.find_by first_name: 'Mahima'
  User Load (0.1ms)  SELECT "users".* FROM "users" WHERE "users"."first_name" = $1 LIMIT $2  [["first_name", "Mahima"], ["LIMIT", 1]]
 =>                                                                                         
#<User:0x00007fc3207b2448                                                                   
...                                                                                         
3.0.0 :034 > student
 => 
#<User:0x00007fc3207b2448                                                                   
 id: 5,                                                                                     
 first_name: "Mahima",                                                                      
 last_name: nil,                                                                            
 created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,                                
 updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,                                
 type: nil,                                                                                 
 teacher_id: 7> 

3.0.0 :035 > student = User.find_by first_name: 'Mridula'
  User Load (0.2ms)  SELECT "users".* FROM "users" WHERE "users"."first_name" = $1 LIMIT $2  [["first_name", "Mridula"], ["LIMIT", 1]]
 => 
#<Admin:0x000055bfbe8ce6e0
... 
3.0.0 :036 > student
 => 
#<Admin:0x000055bfbe8ce6e0
 id: 3,
 first_name: "Mridula",
 last_name: nil,
 created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
 updated_at: Thu, 09 Jun 2022 14:32:46.658374000 UTC +00:00,
 type: "Admin",
 teacher_id: 4> 

=end
