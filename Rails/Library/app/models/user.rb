class User < ApplicationRecord
  has_many :students, class_name: "User", foreign_key: "teacher_id"

  belongs_to :teacher, class_name: "User", optional:true
end

=begin
# Ordering
To retrieve records from the database in a specific order, you can use the order method.
For example, if you're getting a set of records and want to order them in ascending order by the created_at field in your table:
3.0.0 :017 > User.order(:created_at)
  User Load (1.3ms)  SELECT "users".* FROM "users" ORDER BY "users"."created_at" ASC
 =>                                                                               
[#<User:0x00005653e6f57180                                                        
  id: 1,                                                                          
  first_name: "Mary",                                                             
  last_name: nil,                                                                 
  created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,                     
  updated_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,                     
  type: nil,                                                                      
  teacher_id: nil>,                                                               
 #<Reader:0x00005653e7787a30                                                      
  id: 2,                                                                          
  first_name: "Mridul",                                                           
  last_name: nil,                                                                 
  created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:19:26.000191000 UTC +00:00,
  type: "Reader",
  teacher_id: 1>,
 #<Admin:0x00005653e7d7ffa0
  id: 3,
  first_name: "Mridula",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:32:46.658374000 UTC +00:00,
  type: "Admin",
  teacher_id: 4>,
 #<Reader:0x00005653e7aa9948
  id: 4,
  first_name: "Manu",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  type: "Reader",
  teacher_id: nil>,
 #<User:0x00005653e7aa9290
  id: 5,
  first_name: "Mahima",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,
  type: nil,
  teacher_id: 7>,
 #<User:0x00005653e7aa8c00
  id: 6,
  first_name: "Andy",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x00005653e7aa8660
  id: 7,
  first_name: "Raman",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x00007f39f409bf20
  id: 8,
  first_name: "Aryan",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:27:50.715381000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:27:50.715381000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x00007f39f409bc50
  id: 9,
  first_name: "Nina",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,
  type: nil,
  teacher_id: nil>] 

You could specify ASC or DESC as well:
3.0.0 :019 > User.order(created_at: :asc)
  User Load (0.5ms)  SELECT "users".* FROM "users" ORDER BY "users"."created_at" ASC
 =>                                                                                           
[#<User:0x00005653e98e7388                                                                    
  id: 1,                                                                                      
  first_name: "Mary",                                                                         
  last_name: nil,                                                                             
  created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,                                 
  updated_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,                                 
  type: nil,                                                                                  
  teacher_id: nil>,
 #<Reader:0x00005653e98e7270
  id: 2,
  first_name: "Mridul",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:19:26.000191000 UTC +00:00,
  type: "Reader",
  teacher_id: 1>,
 #<Admin:0x00005653e98e7158
  id: 3,
  first_name: "Mridula",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:32:46.658374000 UTC +00:00,
  type: "Admin",
  teacher_id: 4>,
 #<Reader:0x00005653e98e7040
  id: 4,
  first_name: "Manu",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  type: "Reader",
  teacher_id: nil>,
 #<User:0x00005653e98e6f78
  id: 5,
  first_name: "Mahima",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,
  type: nil,
  teacher_id: 7>,
 #<User:0x00005653e98e6eb0
  id: 6,
  first_name: "Andy",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x00005653e98e6de8
  id: 7,
  first_name: "Raman",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x00005653e98e6d20
  id: 8,
  first_name: "Aryan",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:27:50.715381000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:27:50.715381000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x00005653e98e6c58
  id: 9,
  first_name: "Nina",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,
  type: nil,
  teacher_id: nil>] 


3.0.0 :021 > User.order(created_at: :desc)
  User Load (0.3ms)  SELECT "users".* FROM "users" ORDER BY "users"."created_at" DESC
 =>                                                                                           
[#<User:0x00007f39f48fe640                                                                    
  id: 9,                                                                                      
  first_name: "Nina",                                                                         
  last_name: nil,                                                                             
  created_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,                                 
  updated_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,                                 
  type: nil,                                                                                  
  teacher_id: nil>,                                                                           
 #<User:0x00007f39f48fe528                                              
  id: 8,                                                                
  first_name: "Aryan",                                                  
  last_name: nil,                                                       
  created_at: Fri, 10 Jun 2022 12:27:50.715381000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:27:50.715381000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x00007f39f48fe3e8
  id: 7,
  first_name: "Raman",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x00007f39f48fe2a8
  id: 6,
  first_name: "Andy",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x00007f39f48fe1b8
  id: 5,
  first_name: "Mahima",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,
  type: nil,
  teacher_id: 7>,
 #<Reader:0x00007f39f48fe000
  id: 4,
  first_name: "Manu",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  type: "Reader",
  teacher_id: nil>,
 #<Admin:0x00007f39f48fdda8
  id: 3,
  first_name: "Mridula",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:32:46.658374000 UTC +00:00,
  type: "Admin",
  teacher_id: 4>,
 #<Reader:0x00007f39f48fdb00
  id: 2,
  first_name: "Mridul",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:19:26.000191000 UTC +00:00,
  type: "Reader",
  teacher_id: 1>,
 #<User:0x00007f39f48fd948
  id: 1,
  first_name: "Mary",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
  type: nil,
  teacher_id: nil>] 

Or ordering by multiple fields:
3.0.0 :022 > User.order(created_at: :desc,teacher_id: :asc)
  User Load (0.3ms)  SELECT "users".* FROM "users" ORDER BY "users"."created_at" DESC, "users"."teacher_id" ASC
 =>                                                                                                             
[#<User:0x00005653e93d1880                                                                                      
  id: 9,                                                                                                        
  first_name: "Nina",                                                                                           
  last_name: nil,                                                                                               
  created_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,                                                   
  updated_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,                                                   
  type: nil,                                                                                                    
  teacher_id: nil>,                                                                                             
 #<User:0x00005653e93d17b8                                                                                      
  id: 8,                                                                                                        
  first_name: "Aryan",                                                                                          
  last_name: nil,                                                                                               
  created_at: Fri, 10 Jun 2022 12:27:50.715381000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:27:50.715381000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x00005653e93d16f0
  id: 7,
  first_name: "Raman",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x00005653e93d1628
  id: 6,
  first_name: "Andy",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x00005653e93d1560
  id: 5,
  first_name: "Mahima",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,
  type: nil,
  teacher_id: 7>,
 #<Reader:0x00005653e93d1448
  id: 4,
  first_name: "Manu",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  type: "Reader",
  teacher_id: nil>,
 #<Admin:0x00005653e93d1330
  id: 3,
  first_name: "Mridula",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:32:46.658374000 UTC +00:00,
  type: "Admin",
  teacher_id: 4>,
 #<Reader:0x00005653e93d1218
  id: 2,
  first_name: "Mridul",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:19:26.000191000 UTC +00:00,
  type: "Reader",
  teacher_id: 1>,
 #<User:0x00005653e93d1150
  id: 1,
  first_name: "Mary",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
  type: nil,
  teacher_id: nil>] 

=end
