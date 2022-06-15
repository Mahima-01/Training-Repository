class Person < ApplicationRecord
  self.table_name = "users"
  validates_length_of :first_name, maximum: 6
  #before_validation :remove_whitespaces
  after_validation :remove_whitespaces

  def remove_whitespaces
    first_name.strip!
  end
end


=begin
# before_validation
Defines a callback that will get called right before validation.
3.0.0 :006 > p = Person.create(first_name: "Mahi")
  TRANSACTION (0.3ms)  BEGIN
  Person Create (0.4ms)  INSERT INTO "users" ("first_name", "last_name", "created_at", "updated_at", "type", "teacher_id", "login", "email") VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING "id"  [["first_name", "Mahi"], ["last_name", nil], ["created_at", "2022-06-15 12:03:03.725461"], ["updated_at", "2022-06-15 12:03:03.725461"], ["type", nil], ["teacher_id", nil], ["login", nil], ["email", nil]]
  TRANSACTION (6.7ms)  COMMIT                            
 =>                                                      
#<Person:0x000055c8388582d8 
3.0.0 :007 > p.valid?
 => true 

3.0.0 :008 > p = Person.create(first_name: " Mahi")
  TRANSACTION (0.2ms)  BEGIN
  Person Create (0.5ms)  INSERT INTO "users" ("first_name", "last_name", "created_at", "updated_at", "type", "teacher_id", "login", "email") VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING "id"  [["first_name", "Mahi"], ["last_name", nil], ["created_at", "2022-06-15 12:05:35.777370"], ["updated_at", "2022-06-15 12:05:35.777370"], ["type", nil], ["teacher_id", nil], ["login", nil], ["email", nil]]
  TRANSACTION (1.6ms)  COMMIT
 => 
#<Person:0x000055c838b33e30


# after_validation:
Defines a callback that will get called right after validation
3.0.0 :005 > p = Person.create(first_name: "Mahima  ")
 => 
#<Person:0x00007f340011fbf8
3.0.0 :006 > p
 => 
#<Person:0x00007f340011fbf8                  
 id: nil,                                    
 first_name: "Mahima",                       
 last_name: nil,                             
 created_at: nil,                            
 updated_at: nil,                            
 type: nil,                                  
 teacher_id: nil,                            
 login: nil,                                 
 email: nil> 

3.0.0 :007 > p.valid?
 => true 

3.0.0 :010 > p = Person.create(first_name: "Mahima\t ")
 => 
#<Person:0x0000564fd190c370  
3.0.0 :011 > p
 => 
#<Person:0x0000564fd190c370                  
 id: nil,                                    
 first_name: "Mahima",                       
 last_name: nil,                             
 created_at: nil,                            
 updated_at: nil,                            
 type: nil,                                  
 teacher_id: nil,                            
 login: nil,                                 
 email: nil>  
 
=end
