class User < ApplicationRecord
  has_many :students, class_name: "User", foreign_key: "teacher_id"

  belongs_to :teacher, class_name: "User", optional:true
end

=begin
# Selecting Specific Fields
By default, Model.find selects all the fields from the result set using select *.
To select only a subset of fields from the result set, you can specify the subset via the select method.
3.0.0 :003 > student =  User.select(:first_name, :teacher_id)
  User Load (7.4ms)  SELECT "users"."first_name", "users"."teacher_id" FROM "users"
 =>                                                                                                                                       
[#<User:0x00005653e9903fb0 id: nil, first_name: "Mary", teacher_id: nil>,                                                                 
...  
3.0.0 :04 >  User.select(:first_name).distinct
  User Load (0.2ms)  SELECT DISTINCT "users"."first_name" FROM "users"
 =>                                     
[#<User:0x00005653e93f2440 id: nil, first_name: "Raman">,
 #<User:0x00005653e93f2378 id: nil, first_name: "Mahima">,
 #<User:0x00005653e93f22b0 id: nil, first_name: "Mary">,
 #<User:0x00005653e93f21e8 id: nil, first_name: "Nina">,
 #<User:0x00005653e93f2120 id: nil, first_name: "Andy">,
 #<User:0x00005653e93f2030 id: nil, first_name: "Aryan">,
 #<User:0x00005653e93f1f40 id: nil, first_name: "Mridula">,
 #<User:0x00005653e93f1e50 id: nil, first_name: "Mridul">,
 #<User:0x00005653e93f1d88 id: nil, first_name: "Manu">] 
3.0.0 :005 > student
 => 
[#<User:0x00005653e9903fb0 id: nil, first_name: "Mary", teacher_id: nil>,                                              
 #<User:0x00005653e9903e20 id: nil, first_name: "Manu", teacher_id: nil>,                                              
 #<User:0x00005653e9903d30 id: nil, first_name: "Mridul", teacher_id: 1>,
 #<User:0x00005653e9903c40 id: nil, first_name: "Mahima", teacher_id: 7>,
 #<User:0x00005653e9903b50 id: nil, first_name: "Mridula", teacher_id: 4>,
 #<User:0x00005653e9903a60 id: nil, first_name: "Andy", teacher_id: nil>,
 #<User:0x00005653e9903970 id: nil, first_name: "Raman", teacher_id: nil>,
 #<User:0x00005653e9903880 id: nil, first_name: "Aryan", teacher_id: nil>,
 #<User:0x00005653e9903768 id: nil, first_name: "Nina", teacher_id: nil>] 
3.0.0 :009 > student.select(:first_name).distinct
  User Load (0.3ms)  SELECT DISTINCT "users"."first_name" FROM "users"
 =>                                                                               
[#<User:0x00007f39f4425f60 id: nil, first_name: "Raman">,                         
 #<User:0x00007f39f4425d30 id: nil, first_name: "Mahima">,                        
 #<User:0x00007f39f4425ba0 id: nil, first_name: "Mary">,                          
 #<User:0x00007f39f4425a10 id: nil, first_name: "Nina">,                          
 #<User:0x00007f39f44258d0 id: nil, first_name: "Andy">,                          
 #<User:0x00007f39f4425650 id: nil, first_name: "Aryan">,                         
 #<User:0x00007f39f4425330 id: nil, first_name: "Mridula">,
 #<User:0x00007f39f4425010 id: nil, first_name: "Mridul">,
 #<User:0x00007f39f4424cf0 id: nil, first_name: "Manu">]                         
...                                                      
3.0.0 :012 >  User.select(:teacher_id).distinct
  User Load (0.5ms)  SELECT DISTINCT "users"."teacher_id" FROM "users"
 =>                                                                                 
[#<User:0x00007f39f48ff1a8 id: nil, teacher_id: nil>,                               
 #<User:0x00007f39f48ff090 id: nil, teacher_id: 4>,                                 
 #<User:0x00007f39f48fef78 id: nil, teacher_id: 7>,                                 
 #<User:0x00007f39f48fee38 id: nil, teacher_id: 1>]
3.0.0 :015 > query =  User.select(:teacher_id).distinct
  User Load (0.3ms)  SELECT DISTINCT "users"."teacher_id" FROM "users"
 =>                                                                                         
[#<User:0x00007f39f44e79f8 id: nil, teacher_id: nil>,
You can also remove the uniqueness constraint:
3.0.0 :016 > query.distinct(false)
  User Load (0.3ms)  SELECT "users"."teacher_id" FROM "users"
 =>                                                                                         
[#<User:0x00005653e9317b60 id: nil, teacher_id: nil>,                                       
 #<User:0x00005653e9317a70 id: nil, teacher_id: nil>,                                       
 #<User:0x00005653e9317980 id: nil, teacher_id: 1>,                                         
 #<User:0x00005653e9317890 id: nil, teacher_id: 7>,                                         
 #<User:0x00005653e9317778 id: nil, teacher_id: 4>,                                         
 #<User:0x00005653e9317688 id: nil, teacher_id: nil>,                                       
 #<User:0x00005653e9317598 id: nil, teacher_id: nil>,
 #<User:0x00005653e93174a8 id: nil, teacher_id: nil>,
 #<User:0x00005653e9317390 id: nil, teacher_id: nil>] 
=end
