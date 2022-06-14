class User < ApplicationRecord
  has_many :students, class_name: "User", foreign_key: "teacher_id"

  belongs_to :teacher, class_name: "User", optional:true

end

=begin
# references(*table_names):
Use to indicate that the given table_names are referenced by an SQL string, and should therefore be JOINed in any query rather than loaded separately. 
This method only works in conjunction with includes.
3.0.0 :017 > User.includes(:students).where("first_name = 'Mahima'").references(:users)
  User Load (0.5ms)  SELECT "users".* FROM "users" WHERE (first_name = 'Mahima')
  User Load (0.1ms)  SELECT "users".* FROM "users" WHERE "users"."teacher_id" = $1  [["teacher_id", 5]]                                   
 =>                                                                                                                                       
[#<User:0x000055d3d3896be0                                                                                                                
  id: 5,                                                                                                                                  
  first_name: "Mahima",                                                                                                                   
  last_name: nil,                                                                                                                         
  created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,                                                                             
  updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,                                                                             
  type: nil,                                                                                                                              
  teacher_id: 7>]

3.0.0 :019 > User.includes(:students).where("first_name = 'Nina'").references(:users)
  User Load (0.3ms)  SELECT "users".* FROM "users" WHERE (first_name = 'Nina')
  User Load (0.2ms)  SELECT "users".* FROM "users" WHERE "users"."teacher_id" = $1  [["teacher_id", 9]]
 => 
[#<User:0x000055d3d28b1360
  id: 9,
  first_name: "Nina",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,
  type: nil,
  teacher_id: nil>] 

3.0.0 :023 > User.includes(:students).where("first_name = 'Jane'").references(:users)
  User Load (0.3ms)  SELECT "users".* FROM "users" WHERE (first_name = 'Jane')
 => [] 

3.0.0 :025 > User.includes(:students).where("first_name = 'Mridula'").references(:users)
  User Load (0.7ms)  SELECT "users".* FROM "users" WHERE (first_name = 'Mridula')
  User Load (0.3ms)  SELECT "users".* FROM "users" WHERE "users"."teacher_id" = $1  [["teacher_id", 3]]
 => 
[#<Admin:0x00007fd8988005e8
  id: 3,
  first_name: "Mridula",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:32:46.658374000 UTC +00:00,
  type: "Admin",
  teacher_id: 4>] 



=end
