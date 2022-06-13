class User < ApplicationRecord
  has_many :students, class_name: "User", foreign_key: "teacher_id"

  belongs_to :teacher, class_name: "User", optional:true
end

=begin
# unscope:
You can specify certain conditions to be removed using the unscope method.

3.0.0 :002 > student = User.where('id > 1').limit(5).order('id desc').unscope(:order)
  User Load (0.8ms)  SELECT "users".* FROM "users" WHERE (id > 1) LIMIT $1  [["LIMIT", 5]]
 =>                                                                                                                               
[#<Reader:0x000055a8eeb69120 

3.0.0 :003 > student
 => 
[#<Reader:0x000055a8eeb69120                                                                                                      
  id: 4,                                                                                                                          
  first_name: "Manu",                                                                                                             
  last_name: nil,                                                                                                                 
  created_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,                                                                     
  updated_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,                                                                     
  type: "Reader",                                                                                                                 
  teacher_id: nil>,                     
 #<Reader:0x00007fe49450cbb8            
  id: 2,                                
  first_name: "Mridul",                 
  last_name: nil,                       
  created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:19:26.000191000 UTC +00:00,
  type: "Reader",
  teacher_id: 1>,
 #<User:0x00007fe49450c8c0
  id: 5,
  first_name: "Mahima",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,
  type: nil,
  teacher_id: 7>,
 #<Admin:0x000055a8eeb9ce08
  id: 3,
  first_name: "Mridula",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:32:46.658374000 UTC +00:00,
  type: "Admin",
  teacher_id: 4>,
 #<User:0x00007fe4944ef5b8
  id: 6,
  first_name: "Andy",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
  type: nil,
  teacher_id: nil>] 
3.0.0 :004 > student = User.where('id > 1').limit(5).order('id asc').unscope(:order)
  User Load (0.4ms)  SELECT "users".* FROM "users" WHERE (id > 1) LIMIT $1  [["LIMIT", 5]]
 =>                                                                                   
[#<Reader:0x000055a8eefcdfe0                                                          
...                                                                                   
3.0.0 :005 > student
 => 
[#<Reader:0x000055a8eefcdfe0                                                          
  id: 4,                                                                              
  first_name: "Manu",                                                                 
  last_name: nil,                                                                     
  created_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  type: "Reader",
  teacher_id: nil>,
 #<Reader:0x000055a8eefcdec8
  id: 2,
  first_name: "Mridul",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:19:26.000191000 UTC +00:00,
  type: "Reader",
  teacher_id: 1>,
 #<User:0x000055a8eefcde00
  id: 5,
  first_name: "Mahima",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,
  type: nil,
  teacher_id: 7>,
 #<Admin:0x000055a8eefcdce8
  id: 3,
  first_name: "Mridula",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:32:46.658374000 UTC +00:00,
  type: "Admin",
  teacher_id: 4>,
 #<User:0x000055a8eefcdc20
  id: 6,
  first_name: "Andy",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
  type: nil,
  teacher_id: nil>] 

A relation which has used unscope will affect any relation into which it is merged:
3.0.0 :006 > student = User.order('id desc').merge(User.unscope(:order))
  User Load (0.2ms)  SELECT "users".* FROM "users"
 =>                                                                  
[#<User:0x000055a8ee206600                                           
...                        

3.0.0 :007 > student
 => 
[#<User:0x000055a8ee206600                                           
  id: 1,                                                             
  first_name: "Mary",                                                
  last_name: nil,                                             
  created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00, 
  updated_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00, 
  type: nil,                                                  
  teacher_id: nil>,                     
 #<Reader:0x000055a8ee205ac0
  id: 4,
  first_name: "Manu",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  type: "Reader",
  teacher_id: nil>,
 #<Reader:0x000055a8ee205688
  id: 2,
  first_name: "Mridul",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:19:26.000191000 UTC +00:00,
  type: "Reader",
  teacher_id: 1>,
 #<User:0x000055a8ee205390
  id: 5,
  first_name: "Mahima",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,
  type: nil,
  teacher_id: 7>,
 #<Admin:0x000055a8ee204dc8
  id: 3,
  first_name: "Mridula",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:32:46.658374000 UTC +00:00,
  type: "Admin",
  teacher_id: 4>,
 #<User:0x000055a8ee204a30
  id: 6,
  first_name: "Andy",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x000055a8ee204580
  id: 7,
  first_name: "Raman",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x000055a8ee1f3fc8
  id: 8,
  first_name: "Aryan",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:27:50.715381000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:27:50.715381000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x000055a8ee1f3b18
  id: 9,
  first_name: "Nina",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,
  type: nil,
  teacher_id: nil>] 

# only:
You can also override conditions using the only method.
3.0.0 :008 > student = User.where('id > 10').limit(3).order('id desc').only(:order, :where)
  User Load (0.4ms)  SELECT "users".* FROM "users" WHERE (id > 10) ORDER BY id desc
 => []                                   
3.0.0 :009 > student = User.where('id > 3').limit(3).order('id desc').only(:order, :where)
  User Load (0.3ms)  SELECT "users".* FROM "users" WHERE (id > 3) ORDER BY id desc
 =>                                      
[#<User:0x000055a8ed379380 
3.0.0 :010 > student
 => 
[#<User:0x000055a8ed379380              
  id: 9,                                
  first_name: "Nina",                   
  last_name: nil,                       
  created_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x000055a8ed378ae8
  id: 8,
  first_name: "Aryan",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:27:50.715381000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:27:50.715381000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x000055a8ed36fdd0
  id: 7,
  first_name: "Raman",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x000055a8ed36e778
  id: 6,
  first_name: "Andy",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x000055a8ed36dc60
  id: 5,
  first_name: "Mahima",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,
  type: nil,
  teacher_id: 7>,
 #<Reader:0x000055a8ed337ac0
  id: 4,
  first_name: "Manu",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  type: "Reader",
  teacher_id: nil>] 

# reselect:
The reselect method overrides an existing select statement.
3.0.0 :011 > student = User.select(:name).reselect(:created_at)
  User Load (0.3ms)  SELECT "users"."created_at" FROM "users"
 =>                                                                                                 
[#<User:0x000055a8ef99a6b8 id: nil, created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00>,    
...
.0.0 :012 > student
 => 
[#<User:0x000055a8ef99a6b8 id: nil, created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00>,    
 #<User:0x000055a8ef99a5c8 id: nil, created_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00>,    
 #<User:0x000055a8ef99a4d8 id: nil, created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00>,
 #<User:0x000055a8ef99a3e8 id: nil, created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00>,
 #<User:0x000055a8ef99a2d0 id: nil, created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00>,
 #<User:0x000055a8ef99a1e0 id: nil, created_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00>,
 #<User:0x000055a8ef99a0f0 id: nil, created_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00>,
 #<User:0x000055a8ef999fd8 id: nil, created_at: Fri, 10 Jun 2022 12:27:50.715381000 UTC +00:00>,
 #<User:0x000055a8ef999e98 id: nil, created_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00>] 

3.0.0 :016 > student = User.select(:created_at).reselect(:first_name)
  User Load (0.4ms)  SELECT "users"."first_name" FROM "users"
 =>                                                                                                          
[#<User:0x000055a8ef703850 id: nil, first_name: "Mary">, 
3.0.0 :017 > student
 => 
[#<User:0x000055a8ef703850 id: nil, first_name: "Mary">,                                                
 #<User:0x000055a8ef703788 id: nil, first_name: "Manu">,                                                
 #<User:0x000055a8ef7036c0 id: nil, first_name: "Mridul">,  
 #<User:0x000055a8ef7035f8 id: nil, first_name: "Mahima">,  
 #<User:0x000055a8ef703530 id: nil, first_name: "Mridula">, 
 #<User:0x000055a8ef703468 id: nil, first_name: "Andy">,    
 #<User:0x000055a8ef7033a0 id: nil, first_name: "Raman">,   
 #<User:0x000055a8ef7032d8 id: nil, first_name: "Aryan">,   
 #<User:0x000055a8ef703210 id: nil, first_name: "Nina">] 

# reorder:
The reorder method overrides the default scope order.
3.0.0 :018 > student = User.find(7).students.reorder('first_name ASC')
  User Load (0.1ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 7], ["LIMIT", 1]]
  User Load (0.5ms)  SELECT "users".* FROM "users" WHERE "users"."teacher_id" = $1 ORDER BY first_name ASC  [["teacher_id", 7]]
 =>                                                                                                                        
[#<User:0x00007fe494a4d7f8 
3.0.0 :019 > student
 => 
[#<User:0x00007fe494a4d7f8                                                                                                 
  id: 5,                                                                                                                   
  first_name: "Mahima",                                                                                                    
  last_name: nil,                                                                            
  created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,                                
  updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,                                
  type: nil,                                                                                 
  teacher_id: 7>] 

# reverse_order:
The reverse_order method reverses the ordering clause if specified.
3.0.0 :021 > student = User.where("teacher_id > 3").order(:teacher_id).reverse_order
  User Load (0.4ms)  SELECT "users".* FROM "users" WHERE (teacher_id > 3) ORDER BY "users"."teacher_id" DESC
 =>                                                                                                                 
[#<User:0x000055a8f0047bf0 
3.0.0 :025 > student
 => 
[#<User:0x000055a8f0047bf0        
  id: 5,                          
  first_name: "Mahima",           
  last_name: nil,                 
  created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,
  type: nil,                      
  teacher_id: 7>,                 
 #<Admin:0x000055a8f0047ad8       
  id: 3,
  first_name: "Mridula",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:32:46.658374000 UTC +00:00,
  type: "Admin",
  teacher_id: 4>] 
3.0.0 :026 > student = User.where("teacher_id > 10").reverse_order
  User Load (0.7ms)  SELECT "users".* FROM "users" WHERE (teacher_id > 10) ORDER BY "users"."id" DESC
 => [] 
3.0.0 :028 > student = User.where("teacher_id > 5").reverse_order
  User Load (0.7ms)  SELECT "users".* FROM "users" WHERE (teacher_id > 5) ORDER BY "users"."id" DESC
 =>                                                                      
[#<User:0x000055a8f0066c30                                               
...                                                                      
3.0.0 :029 > student
 => 
[#<User:0x000055a8f0066c30                                              
  id: 5,                                                                
  first_name: "Mahima",                                                 
  last_name: nil,
  created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,
  type: nil,
  teacher_id: 7>] 

The reverse_order method accepts no arguments.
# rewhere:
The rewhere method overrides an existing, named where condition.
3.0.0 :033 > student = User.where(last_name: true).rewhere(first_name: false)
  User Load (0.2ms)  SELECT "users".* FROM "users" WHERE "users"."last_name" = $1 AND "users"."first_name" = $2  [["last_name", "t"], ["first_name", "f"]]                                                                 
 => [] 
3.0.0 :036 > student = User.where("teacher_id > 5").rewhere(first_name: false)
  User Load (0.4ms)  SELECT "users".* FROM "users" WHERE (teacher_id > 5) AND "users"."first_name" = $1  [["first_name", "f"]]
 => []                                                                  
3.0.0 :037 > student
 => [] 

# Null relation:
none():
Returns a chainable relation with zero records.
The returned relation implements the Null Object pattern. 
It is an object with defined null behavior and always returns an empty array of records without querying the database.
3.0.0 :039 > student = User.none
 => [] 
=end
