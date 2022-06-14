class User < ApplicationRecord
  has_many :students, class_name: "User", foreign_key: "teacher_id"

  belongs_to :teacher, class_name: "User", optional:true

end

=begin
# extract_associated(association):
Extracts a named association from the relation. 
The named association is first preloaded, then the individual association records are collected from the relation.
3.0.0 :015 > User.extract_associated(:teacher)
  User Load (0.6ms)  SELECT "users".* FROM "users"
  User Load (0.4ms)  SELECT "users".* FROM "users" WHERE "users"."id" IN ($1, $2, $3)  [["id", 1], ["id", 7], ["id", 4]]
 =>                                                                                            
[nil,                                                                                          
 nil,                                                                                          
 #<User:0x000055d3d39dfba0                                                                     
  id: 1,                                                                                       
  first_name: "Mary",                                                                          
  last_name: nil,                                                                              
  created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,        
  updated_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,        
  type: nil,                                                         
  teacher_id: nil>,                                                  
 #<User:0x000055d3d39df7e0                                           
  id: 7,
  first_name: "Raman",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<Reader:0x000055d3d39df8d0
  id: 4,
  first_name: "Manu",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  type: "Reader",
  teacher_id: nil>,
 nil,
 nil,
 nil,
 nil,
 nil,
 nil] 

=end
