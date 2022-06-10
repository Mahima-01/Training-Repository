class User < ApplicationRecord
  has_many :students, class_name: "User", foreign_key: "teacher_id"

  belongs_to :teacher, class_name: "User", optional:true
end

=begin
# Limit and Offset
To apply LIMIT to the SQL fired by the Model.find, you can specify the LIMIT using limit and offset methods on the relation.
You can use limit to specify the number of records to be retrieved, and use offset to specify the 
number of records to skip before starting to return the records.

3.0.0 :059 > student = User.limit(4)
  User Load (0.2ms)  SELECT "users".* FROM "users" LIMIT $1  [["LIMIT", 4]]
 =>                                                                                                              
[#<User:0x00007fc320aa7130                                                                                       
...                                                                                                              
3.0.0 :060 > student
 => 
[#<User:0x00007fc320aa7130
  id: 1,                                                                                                         
  first_name: "Mary",                                                                                            
  last_name: nil,                                                                                                
  created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,                                                    
  updated_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,                                                    
  type: nil,                                                                                                     
  teacher_id: nil>,                                                                                              
 #<Reader:0x00007fc320aa6ff0                                                                                     
  id: 4,
  first_name: "Manu",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  type: "Reader",
  teacher_id: nil>,
 #<Reader:0x00007fc320aa6e88
  id: 2,
  first_name: "Mridul",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:19:26.000191000 UTC +00:00,
  type: "Reader",
  teacher_id: 1>,
 #<User:0x00007fc320aa6dc0
  id: 5,
  first_name: "Mahima",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,
  type: nil,
  teacher_id: 7>] 

3.0.0 :061 > student = User.offset(2)
  User Load (0.2ms)  SELECT "users".* FROM "users" OFFSET $1  [["OFFSET", 2]]
 =>                                                                   
[#<Reader:0x00007fc320124798                                          
...                                                                   
3.0.0 :062 > student
 => 
[#<Reader:0x00007fc320124798                                          
  id: 2,                                                              
  first_name: "Mridul",                                               
  last_name: nil,                                                     
  created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,         
  updated_at: Thu, 09 Jun 2022 14:19:26.000191000 UTC +00:00,         
  type: "Reader",                                                     
  teacher_id: 1>,                                                     
 #<User:0x00007fc3201246d0                                            
  id: 5,
  first_name: "Mahima",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,
  type: nil,
  teacher_id: 7>,
 #<Admin:0x00007fc3201245b8
  id: 3,
  first_name: "Mridula",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:32:46.658374000 UTC +00:00,
  type: "Admin",
  teacher_id: 4>] 

3.0.0 :063 > student = User.limit(4).offset(1)
  User Load (0.3ms)  SELECT "users".* FROM "users" LIMIT $1 OFFSET $2  [["LIMIT", 4], ["OFFSET", 1]]
 =>                                                                                           
[#<Reader:0x00007fc320625bc0                                                                  
...                                                                                           
3.0.0 :064 > student
 => 
[#<Reader:0x00007fc320625bc0                                                                  
  id: 4,                                                                                      
  first_name: "Manu",                                                                         
  last_name: nil,                                                                             
  created_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,                                 
  updated_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,                                 
  type: "Reader",                                                                             
  teacher_id: nil>,                                                                           
 #<Reader:0x00007fc320625aa8                                                                  
  id: 2,
  first_name: "Mridul",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:19:26.000191000 UTC +00:00,
  type: "Reader",
  teacher_id: 1>,
 #<User:0x00007fc3206259e0
  id: 5,
  first_name: "Mahima",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,
  type: nil,
  teacher_id: 7>,
 #<Admin:0x00007fc3206258c8
  id: 3,
  first_name: "Mridula",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:32:46.658374000 UTC +00:00,
  type: "Admin",
  teacher_id: 4>] 
# Group
To apply a GROUP BY clause to the SQL fired by the finder, you can use the group method.

3.0.0 :065 > student = User.select("created_at").group("created_at")
  User Load (0.5ms)  SELECT "users"."created_at" FROM "users" GROUP BY "users"."created_at"
 =>                                      
[#<User:0x000055bfbdfeb7a8 id: nil, created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00>,
...                                      
3.0.0 :066 > student
 => 
[#<User:0x000055bfbdfeb7a8 id: nil, created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00>,
 #<User:0x000055bfbdfeb6b8 id: nil, created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00>,
 #<User:0x000055bfbdfeb5c8 id: nil, created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00>,
 #<User:0x000055bfbdfeb4d8 id: nil, created_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00>,
 #<User:0x000055bfbdfeb398 id: nil, created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00>] 
3.0.0 :067 > 
=end
