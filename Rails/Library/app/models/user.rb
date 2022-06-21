class User < ApplicationRecord
  after_initialize do |user|
    puts "You have initialized an object!"
  end

  after_find do |user|
    puts "You have found an object!"
  end
end



=begin
# after_initialize and after_find:
The after_initialize callback will be called whenever an Active Record object is instantiated, 
either by directly using new or when a record is loaded from the database. It can be useful to avoid the need to directly override your Active Record initialize method.

The after_find callback will be called whenever Active Record loads a record from the database. 
after_find is called before after_initialize if both are defined.
The after_initialize and after_find callbacks have no before_* counterparts, but they can be registered just like the other Active Record callbacks.

3.0.0 :005 > user = User.new
You have initialized an object!
 => #<User:0x00007f0e5c944fc8 id: nil, first_name: nil, last_name: nil, created_at: nil, updated_at: nil, type: nil, teacher_id: nil, login: nil, e... 

3.0.0 :007 > User.first
  User Load (1.2ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT $1  [["LIMIT", 1]]
You have found an object!                                   
You have initialized an object!                  
 =>                                              
#<User:0x00007f0e5c8cde28                        
 id: 1,                                          
 first_name: "Mary",                             
 last_name: nil,                                 
 created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
 updated_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
 type: nil,                                      
 teacher_id: nil,                                
 login: nil,                                     
 email: nil>                                                      

=end
