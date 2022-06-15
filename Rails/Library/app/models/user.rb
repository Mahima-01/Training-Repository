class User < ApplicationRecord
  #has_many :students, class_name: "User", foreign_key: "teacher_id"
  #belongs_to :teacher, class_name: "User", optional:true
  validates :login, :email, presence: true
  before_validation :ensure_login_has_a_value

  def ensure_login_has_a_value
    if login.nil?
      self.login = email unless email.blank?
    end
  end
end


=begin
# Callback Registration:
Callbacks are methods that get called at certain moments of an object's life cycle. With callbacks 
it is possible to write code that will run whenever an Active Record object is created, saved, updated, deleted, validated, or loaded from the database.

3.0.0 :001 > user =  User.new
 => #<User:0x000056256e684e28 id: nil, first_name: nil, last_name: nil, created_at: nil, updated_at: nil, type: nil, teacher_id: nil, login: nil, e... 
3.0.0 :002 > user = User.find_by(email: 'larry@gmail.com')
  User Load (0.2ms)  SELECT "users".* FROM "users" WHERE "users"."email" = $1 LIMIT $2  [["email", "larry@gmail.com"], ["LIMIT", 1]]
 =>                                                             
#<User:0x00007fa3609f8638  
3.0.0 :003 > user.valid?
 => true 

3.0.0 :004 > user = User.new(email: '')
 => #<User:0x000056256d274a00 id: nil, first_name: nil, last_name: nil, created_at: nil, updated_at: nil, type: nil, teacher_id: nil, login: nil, e... 
3.0.0 :005 > user.valid?
 => false 

3.0.0 :008 > user = User.find_by(email: 'dev@gmail.com')
  User Load (0.4ms)  SELECT "users".* FROM "users" WHERE "users"."email" = $1 LIMIT $2  [["email", "dev@gmail.com"], ["LIMIT", 1]]
 =>                                                             
#<User:0x000056256e88a8f8                                       
...                                                             
3.0.0 :009 > user.valid?
 => true 

3.0.0 :010 > user = User.find_by(first_name: 'Nina')
  User Load (0.3ms)  SELECT "users".* FROM "users" WHERE "users"."first_name" = $1 LIMIT $2  [["first_name", "Nina"], ["LIMIT", 1]]
 => 
#<User:0x000056256e992ca0
... 
3.0.0 :011 > user.valid?
 => false 
 
=end
