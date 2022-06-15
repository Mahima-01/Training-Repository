class User < ApplicationRecord
  #has_many :students, class_name: "User", foreign_key: "teacher_id"
  #belongs_to :teacher, class_name: "User", optional:true
  validates :login, :email, presence: true
  before_save :ensure_login_has_a_value

  def ensure_login_has_a_value
    if type.nil?
      self.type = email unless email.blank?
    end
  end
end


=begin
# before_save:
Registers a callback to be called before a record is saved. 
3.0.0 :002 > user.login = 'Gagan'
 => "Gagan" 
3.0.0 :006 > user.valid?
 => false 

3.0.0 :002 > user.login = 'Gagan'
 => "Gagan" 
3.0.0 :008 > user.email = 'Gagan@gmail.com'
 => "Gagan@gmail.com" 
3.0.0 :009 > user.valid?
 => true 

3.0.0 :002 > user.login = 'Gagan'
 => "Gagan" 
3.0.0 :003 > user.login = 'Gagan'
3.0.0 :004 > user.save
  TRANSACTION (0.1ms)  BEGIN
  User Create (0.3ms)  INSERT INTO "users" ("first_name", "last_name", "created_at", "updated_at", "type", "teacher_id", "login", "email") VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING "id"  [["first_name", nil], ["last_name", nil], ["created_at", "2022-06-15 09:12:18.815525"], ["updated_at", "2022-06-15 09:12:18.815525"], ["type", "Gagan@gmail.com"], ["teacher_id", nil], ["login", "Gagan"], ["email", "Gagan@gmail.com"]]
  TRANSACTION (6.6ms)  COMMIT                                                   
 => true                 

3.0.0 :006 > user.email = 'neeraj@gmail.com'
 => "neeraj@gmail.com" 
3.0.0 :007 > user.login = 'Neeraj'
 => "Neeraj"
3.0.0 :008 > user.save
  TRANSACTION (0.2ms)  BEGIN
  User Update (0.4ms)  UPDATE "users" SET "updated_at" = $1, "login" = $2, "email" = $3 WHERE "users"."id" = $4  [["updated_at", "2022-06-15 09:13:50.444430"], ["login", "Neeraj"], ["email", "neeraj@gmail.com"], ["id", 14]]
  TRANSACTION (6.4ms)  COMMIT                 
 => true 
3.0.0 :009 > user.valid?
 => true 

3.0.0 :003 > user.login = 'Anjali'
 => "Anjali"
3.0.0 :005 > user.save!
  TRANSACTION (0.4ms)  BEGIN
  User Create (0.4ms)  INSERT INTO "users" ("first_name", "last_name", "created_at", "updated_at", "type", "teacher_id", "login", "email") VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING "id"  [["first_name", nil], ["last_name", nil], ["created_at", "2022-06-15 09:18:03.177769"], ["updated_at", "2022-06-15 09:18:03.177769"], ["type", "Anjali@gmail.com"], ["teacher_id", nil], ["login", "Anjali"], ["email", "Anjali@gmail.com"]]
  TRANSACTION (6.6ms)  COMMIT                                              
 => true 

=end
