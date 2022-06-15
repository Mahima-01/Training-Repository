class User < ApplicationRecord
  #has_many :students, class_name: "User", foreign_key: "teacher_id"
  #belongs_to :teacher, class_name: "User", optional:true
  validates :login, presence: true
  before_save :call_before_save
  after_save :call_after_save
  around_save :call_around_save
  def call_before_save
    puts 'before user is saved'
  end

  def call_after_save
    puts 'after user is saved'
  end

  def call_around_save
    puts 'in around user save'
    yield # Article saved
    puts 'out around user save'
  end
end


=begin
# around_save:
Called before a new or existing object is saved until yield is invoked within the method triggered by the callback. 
Calling yield causes the object to be saved and then any proceeding code in the method will execute.

3.0.0 :004 > user = User.new(login: 'Kriti')
 => 
#<User:0x00007f192024d750 
3.0.0 :005 > user.save
before user is saved
in around user save                           
  TRANSACTION (0.1ms)  BEGIN                  
  User Create (0.2ms)  INSERT INTO "users" ("first_name", "last_name", "created_at", "updated_at", "type", "teacher_id", "login", "email") VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING "id"  [["first_name", nil], ["last_name", nil], ["created_at", "2022-06-15 10:07:50.712473"], ["updated_at", "2022-06-15 10:07:50.712473"], ["type", nil], ["teacher_id", nil], ["login", "Kriti"], ["email", nil]]
out around user save                          
after user is saved                           
  TRANSACTION (1.3ms)  COMMIT                 
 => true       

3.0.0 :006 > user = User.new(email: 'kriti@gmail.com')
 => 
#<User:0x0000558705ae3990
3.0.0 :007 > user.save
 => false 

3.0.0 :008 > user = User.new(login: 'Sunny')
 => 
#<User:0x00005587049ce858 
3.0.0 :009 > user.save
before user is saved
in around user save                               
  TRANSACTION (0.1ms)  BEGIN                  
  User Create (0.2ms)  INSERT INTO "users" ("first_name", "last_name", "created_at", "updated_at", "type", "teacher_id", "login", "email") VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING "id"  [["first_name", nil], ["last_name", nil], ["created_at", "2022-06-15 10:09:18.051881"], ["updated_at", "2022-06-15 10:09:18.051881"], ["type", nil], ["teacher_id", nil], ["login", "Sunny"], ["email", nil]]
out around user save                          
after user is saved                           
  TRANSACTION (6.5ms)  COMMIT                 
 => true 
=end
