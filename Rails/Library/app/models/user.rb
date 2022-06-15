class User < ApplicationRecord
  #has_many :students, class_name: "User", foreign_key: "teacher_id"
  #belongs_to :teacher, class_name: "User", optional:true
  validates :login, :email, presence: true
  around_create :ensure_login_has_a_value

  def ensure_login_has_a_value
    print "Callback used"
    if type.nil?
      self.type = email unless email.blank?
    end
  end
end


=begin
# before_create:
Registers a callback to be called before a record is created.
3.0.0 :003 > user = User.create(login: "Dia")
 => 
#<User:0x000055d6871bfd60
3.0.0 :004 > user.save
 => false 

3.0.0 :006 > user = User.create(email: "dia@gmail.com")
 => 
#<User:0x000055d686d858f8  
3.0.0 :010 > user.valid?
 => false 

# after_create: 
3.0.0 :005 > user = User.create(email: "dia@gmail.com", login: "Dia")
  TRANSACTION (0.3ms)  BEGIN
  User Create (0.5ms)  INSERT INTO "users" ("first_name", "last_name", "created_at", "updated_at", "type", "teacher_id", "login", "email") VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING "id"  [["first_name", nil], ["last_name", nil], ["created_at", "2022-06-15 11:31:14.174630"], ["updated_at", "2022-06-15 11:31:14.174630"], ["type", nil], ["teacher_id", nil], ["login", "Dia"], ["email", "dia@gmail.com"]]
Callback used  TRANSACTION (1.4ms)  COMMIT                                   
 =>                                                                          
#<User:0x0000558ee344c678   

# around_create:
Registers a callback to be called around the creation of a record.
3.0.0 :001 > user = User.new
 => #<User:0x00007fc520484878 id: nil, first_name: nil, last_name: nil, created_at: nil, updated_at: nil, type: nil, teacher_id: nil, login: nil, e... 
3.0.0 :002 > user = User.create(email: "ria@gmail.com", login: "Ria")
Callback used => 
#<User:0x00007fc520387718   
...                         
3.0.0 :003 > user.valid?
 => true 

=end
