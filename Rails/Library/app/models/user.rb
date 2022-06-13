class User < ApplicationRecord
  has_many :students, class_name: "User", foreign_key: "teacher_id"

  belongs_to :teacher, class_name: "User", optional:true

end

=begin
# Dynamic Finders:
For every field (also known as an attribute) you define in your table, Active Record provides a finder method. 
If you have a field called first_name on your Customer model for example, you get the instance method find_by_first_name for free from Active Record. If you also have a locked field on the Customer model, you also get find_by_locked method.

You can specify an exclamation point (!) on the end of the dynamic finders to get them to raise an ActiveRecord::RecordNotFound error if they do not return any records, like Customer.find_by_name!("Ryan")
3.0.0 :100 > User.find_by_name!("Mridula")
/home/itsacheckmate/.rvm/gems/ruby-3.0.0/gems/activerecord-7.0.3/lib/active_record/dynamic_matchers.rb:22:in `method_missing': undefined method `find_by_name!' for User:Class (NoMethodError)                       
Did you mean?  find_by! 

3.0.0 :103 > User.find_by_first_name_and_teacher_id("Nina", 5)
  User Load (0.2ms)  SELECT "users".* FROM "users" WHERE "users"."first_name" = $1 AND "users"."teacher_id" = $2 LIMIT $3  [["first_name", "Nina"], ["teacher_id", 5], ["LIMIT", 1]]                                                                                                   
 => nil 
3.0.0 :108 > User.find_by_first_name_and_teacher_id("Mahima",7 )
  User Load (0.5ms)  SELECT "users".* FROM "users" WHERE "users"."first_name" = $1 AND "users"."teacher_id" = $2 LIMIT $3  [["first_name", "Mahima"], ["teacher_id", 7], ["LIMIT", 1]]                      
 =>                                                
#<User:0x00007f7f8872bf00
 id: 5,
 first_name: "Mahima",
 last_name: nil,
 created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,
 updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,
 type: nil,
 teacher_id: 7> 
3.0.0 :109 > User.find_by_first_name("Mahima")
  User Load (0.5ms)  SELECT "users".* FROM "users" WHERE "users"."first_name" = $1 LIMIT $2  [["first_name", "Mahima"], ["LIMIT", 1]]
 => 
#<User:0x00007f7f8869d728
 id: 5,
 first_name: "Mahima",
 last_name: nil,
 created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,
 updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,
 type: nil,
 teacher_id: 7> 

3.0.0 :110 > User.find_by_first_name_and_teacher_id("Mridula",4 )
  User Load (0.3ms)  SELECT "users".* FROM "users" WHERE "users"."first_name" = $1 AND "users"."teacher_id" = $2 LIMIT $3  [["first_name", "Mridula"], ["teacher_id", 4], ["LIMIT", 1]]
 => 
#<Admin:0x000055a9fb1fbb20
 id: 3,
 first_name: "Mridula",
 last_name: nil,
 created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
 updated_at: Thu, 09 Jun 2022 14:32:46.658374000 UTC +00:00,
 type: "Admin",
 teacher_id: 4> 
=end
