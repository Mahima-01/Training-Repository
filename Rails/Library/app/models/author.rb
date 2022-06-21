class Author < ApplicationRecord
  after_create_commit :log_user_saved_to_db
  after_update_commit :log_user_saved_to_db
  after_save_commit :log_user_saved_to_db
  private
  def log_user_saved_to_db
    puts 'User was saved to database'
  end
end

=begin
3.0.0 :001 > @user = User.create
  TRANSACTION (0.2ms)  BEGIN
  User Create (0.4ms)  INSERT INTO "users" ("first_name", "last_name", "created_at", "updated_at", "type", "teacher_id", "login", "email") VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING "id"  [["first_name", nil], ["last_name", nil], ["created_at", "2022-06-21 14:47:11.208839"], ["updated_at", "2022-06-21 14:47:11.208839"], ["type", nil], ["teacher_id", nil], ["login", nil], ["email", nil]]
  TRANSACTION (6.7ms)  COMMIT               
 =>                         
#<User:0x00007f6a40ad5028

3.0.0 :002 > @user.save
 => true 

3.0.0 :003 > @user
 => 
#<User:0x00007f6a40ad5028                                    
 id: 29,                                                     
 first_name: nil,                                            
 last_name: nil,                                             
 created_at: Tue, 21 Jun 2022 14:47:11.208839000 UTC +00:00, 
 updated_at: Tue, 21 Jun 2022 14:47:11.208839000 UTC +00:00, 
 type: nil,                                                  
 teacher_id: nil,                                            
 login: nil,                                                 
 email: nil> 

3.0.0 :001 > @user = User.create
  TRANSACTION (0.2ms)  BEGIN
  User Create (0.4ms)  INSERT INTO "users" ("first_name", "last_name", "created_at", "updated_at", "type", "teacher_id", "login", "email") VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING "id"  [["first_name", nil], ["last_name", nil], ["created_at", "2022-06-21 14:52:01.021324"], ["updated_at", "2022-06-21 14:52:01.021324"], ["type", nil], ["teacher_id", nil], ["login", nil], ["email", nil]]
  TRANSACTION (1.3ms)  COMMIT                
 =>                                          
#<User:0x0000559533a47928
3.0.0 :002 > @user.save
 => true 

3.0.0 :004 > @author = Author.create
  TRANSACTION (0.3ms)  BEGIN
  Author Create (0.7ms)  INSERT INTO "authors" ("created_at", "updated_at", "lock_version", "email", "name", "books_count") VALUES ($1, $2, $3, $4, $5, $6) RETURNING "id"  [["created_at", "2022-06-21 14:53:04.592408"], ["updated_at", "2022-06-21 14:53:04.592408"], ["lock_version", 0], ["email", nil], ["name", nil], ["books_count", 0]]                                         
  TRANSACTION (6.4ms)  COMMIT                                          
 =>                                                                    
#<Author:0x00005595344150b8  
3.0.0 :005 > @author.save
User was saved to database
 => true

=end