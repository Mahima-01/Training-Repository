class User < ApplicationRecord
  has_many :students, class_name: "User", foreign_key: "teacher_id"

  belongs_to :teacher, class_name: "User", optional:true
end

=begin
# Self Join:
In designing a data model, you will sometimes find a model that should have a relation to itself. 
For example, you may want to store all users in a single database model, but be able to trace relationships such as between teacher and student. 
This situation can be modeled with self-joining associations:
3.0.0 :001 > user = User.new
 => 
#<User:0x00007f729c749968  
3.0.0 :002 > user = User.find(2)
  User Load (0.3ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 2], ["LIMIT", 1]]                                                          
 =>                                                         
#<Reader:0x0000563d90372610                                 
...  
3.0.0 :003 > teacher = User.find(5)
  User Load (0.4ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 5], ["LIMIT", 1]]                                                          
 =>                                                 
#<User:0x0000563d90407e90 
3.0.0 :005 > teacher.teacher_id = 7
 => 7 
3.0.0 :006 > teacher.save
 => true 
3.0.0 :010 > user
 => 
#<Reader:0x00007f729c7f4390                                 
 id: 2,                                                     
 first_name: "Mridul",                                      
 last_name: nil,                                            
 created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,
 updated_at: Thu, 09 Jun 2022 14:19:26.000191000 UTC +00:00,
 type: "Reader",                                            
 teacher_id: 1>
3.0.0 :011 > teacher = User.find(3)
  User Load (0.5ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 3], ["LIMIT", 1]]                                                  
 => 
#<Admin:0x0000563d8f5c03f0
3.0.0 :014 > teacher.save
 => true 
3.0.0 :015 > user
 => 
#<Reader:0x00007f729c7f4390                      
 id: 2,                                          
 first_name: "Mridul",                           
 last_name: nil,                                 
 created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,
 updated_at: Thu, 09 Jun 2022 14:19:26.000191000 UTC +00:00,
 type: "Reader",                                 
 teacher_id: 1> 
3.0.0 :017 > student = User.find(3)
  User Load (0.5ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 3], ["LIMIT", 1]]                                                  
 =>                                                 
#<Admin:0x0000563d905d2b08 
3.0.0 :018 > student.save!
 => true 
3.0.0 :020 > student
 => 
#<Admin:0x0000563d905d2b08              
 id: 3,                                 
 first_name: "Mridula",                 
 last_name: nil,                        
 created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
 updated_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
 type: "Admin",                         
 teacher_id: nil>
3.0.0 :021 > student.teacher_id = 7
 => 7 
3.0.0 :022 > student.save!
  TRANSACTION (0.1ms)  BEGIN
  Admin Update (0.3ms)  UPDATE "users" SET "updated_at" = $1, "teacher_id" = $2 WHERE "users"."id" = $3  [["updated_at", "2022-06-09 14:31:43.355416"], ["teacher_id", 7], ["id", 3]]
  TRANSACTION (6.5ms)  COMMIT                                  
 => true 
3.0.0 :023 > student
 => 
#<Admin:0x0000563d905d2b08                                     
 id: 3,                                                        
 first_name: "Mridula",                 
 last_name: nil,                        
 created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
 updated_at: Thu, 09 Jun 2022 14:31:43.355416000 UTC +00:00,
 type: "Admin",                         
 teacher_id: 7>
3.0.0 :024 > student.teacher
  User Load (0.3ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 7], ["LIMIT", 1]]                                                             
 => nil
3.0.0 :028 > student.teacher_id = 4
 => 4 
3.0.0 :029 > student.save
 => true
3.0.0 :030 > student.teacher
 => 
#<Reader:0x0000563d8fd11cd0                         
 id: 4,                                             
 first_name: "Manu",                                
 last_name: nil,                                    
 created_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
 updated_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
 type: "Reader",                                    
 teacher_id: nil>
=end
