class User < ApplicationRecord
  #has_many :students, class_name: "User", foreign_key: "teacher_id"
  #belongs_to :teacher, class_name: "User", optional:true
  #validates :login, :email, presence: true
  #around_create :ensure_login_has_a_value
  after_commit :send_email_notifications, on: :create
  
  def send_email_notifications
    # This will send email notifications in the background 
    print "email notification sent."
  end 
end


=begin
# after_commit: 
This callback is called after a record has been created, updated, or destroyed.
You can specify that the callback should only be fired by a certain action with the :on option:

after_commit callback will ensure that the send_email_notifications 
method is executed only when the commit transaction completes in the database.

3.0.0 :001 > user = User.new
 => #<User:0x00007ff9e0a67d90 id: nil, first_name: nil, last_name: nil, created_at: nil, updated_at: nil, type: nil, teacher_id: nil, login: nil, e... 
3.0.0 :002 > user = User.create(email: "ria@gmail.com")
  TRANSACTION (0.2ms)  BEGIN
  User Create (0.9ms)  INSERT INTO "users" ("first_name", "last_name", "created_at", "updated_at", "type", "teacher_id", "login", "email") VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING "id"  [["first_name", nil], ["last_name", nil], ["created_at", "2022-06-15 13:11:20.313029"], ["updated_at", "2022-06-15 13:11:20.313029"], ["type", nil], ["teacher_id", nil], ["login", nil], ["email", "ria@gmail.com"]]
  TRANSACTION (6.5ms)  COMMIT
email notification sent. => 
#<User:0x00007ff9e0387160

3.0.0 :003 > user = User.create(email: "manni@gmail.com")
  TRANSACTION (0.2ms)  BEGIN
  User Create (0.3ms)  INSERT INTO "users" ("first_name", "last_name", "created_at", "updated_at", "type", "teacher_id", "login", "email") VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING "id"  [["first_name", nil], ["last_name", nil], ["created_at", "2022-06-15 13:12:00.397444"], ["updated_at", "2022-06-15 13:12:00.397444"], ["type", nil], ["teacher_id", nil], ["login", nil], ["email", "manni@gmail.com"]]
  TRANSACTION (2.3ms)  COMMIT
email notification sent. => 
#<User:0x0000561fffa7e890
...
=end
