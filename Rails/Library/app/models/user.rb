class User < ApplicationRecord
  has_many :students, class_name: "User", foreign_key: "teacher_id"

  belongs_to :teacher, class_name: "User", optional:true

end

=begin
# annotate:
Adds an SQL comment to queries generated from this relation.
3.0.0 :002 > User.annotate("selecting user names").select(:first_name)
  User Load (7.0ms)  SELECT "users"."first_name" FROM "users" /* selecting user names */
 =>                                                                                                      
[#<User:0x000055d3d3f5c920 id: nil, first_name: "Mary">,                                                 
 #<User:0x000055d3d3f5c790 id: nil, first_name: "Manu">,                                                 
 #<User:0x000055d3d3f5c6a0 id: nil, first_name: "Mridul">,                                               
 #<User:0x000055d3d3f5c5b0 id: nil, first_name: "Mahima">,                                               
 #<User:0x000055d3d3f5c4c0 id: nil, first_name: "Mridula">,                                              
 #<User:0x000055d3d3f5c3d0 id: nil, first_name: "Andy">,                                                 
 #<User:0x000055d3d3f5c2e0 id: nil, first_name: "Raman">,                                                
 #<User:0x000055d3d3f5c1c8 id: nil, first_name: "Aryan">,                                                
 #<User:0x000055d3d3f5c0d8 id: nil, first_name: "Nina">,                                                 
 #<User:0x000055d3d3f57fd8 id: nil, first_name: nil>,                                                    
 #<User:0x000055d3d3f57ee8 id: nil, first_name: "Larry">] 

3.0.0 :003 > User.annotate("selecting", "user", "names").select(:first_name)
  User Load (0.6ms)  SELECT "users"."first_name" FROM "users" /* selecting */ /* user */ /* names */
 =>                                                                                                            
[#<User:0x00007fd8981f0068 id: nil, first_name: "Mary">,                                                       
 #<User:0x000055d3d299bd20 id: nil, first_name: "Manu">,                                                       
 #<User:0x000055d3d299bb40 id: nil, first_name: "Mridul">,                                                     
 #<User:0x000055d3d299b9b0 id: nil, first_name: "Mahima">,                                                     
 #<User:0x000055d3d299b500 id: nil, first_name: "Mridula">,                                                    
 #<User:0x000055d3d299ae48 id: nil, first_name: "Andy">,                                                       
 #<User:0x000055d3d299aa60 id: nil, first_name: "Raman">,                                                      
 #<User:0x000055d3d299a6f0 id: nil, first_name: "Aryan">,                                                      
 #<User:0x000055d3d299a4e8 id: nil, first_name: "Nina">,                                                       
 #<User:0x000055d3d299a178 id: nil, first_name: nil>,                                                          
 #<User:0x000055d3d2999d40 id: nil, first_name: "Larry">] 

=end
