class User < ApplicationRecord
  after_touch do |user|
    puts "You have touched an object"
  end
end



=begin
# after_touch
The after_touch callback will be called whenever an Active Record object is touched.

3.0.0 :005 > user = User.create(first_name: 'Ria')
  TRANSACTION (0.2ms)  BEGIN
  User Create (2.6ms)  INSERT INTO "users" ("first_name", "last_name", "created_at", "updated_at", "type", "teacher_id", "login", "email") VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING "id"  [["first_name", "Ria"], ["last_name", nil], ["created_at", "2022-06-21 12:17:12.399654"], ["updated_at", "2022-06-21 12:17:12.399654"], ["type", nil], ["teacher_id", nil], ["login", nil], ["email", nil]]
  TRANSACTION (0.5ms)  COMMIT          
 =>                                    
#<User:0x00007f07a463dff0   

3.0.0 :006 > user.touch
  TRANSACTION (0.1ms)  BEGIN
  User Update (0.5ms)  UPDATE "users" SET "updated_at" = $1 WHERE "users"."id" = $2  [["updated_at", "2022-06-21 12:17:36.138259"], ["id", 28]]
You have touched an object                                  
  TRANSACTION (0.4ms)  COMMIT                               
 => true  
 
=end
