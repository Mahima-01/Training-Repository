class Person < ApplicationRecord
  validates :checkbox, acceptance: {accept: 1}
end

=begin
# acceptance:
This method validates that a checkbox on the user interface was checked when a form was submitted. 
This is typically used when the user needs to agree to your application's terms of service, confirm that some text is read, or any similar concept.
It usually takes value in form of true or 1. 
class Person < ApplicationRecord
  validates :checkbox, acceptance: true
end
3.0.0 :011 > person.save
  TRANSACTION (0.2ms)  BEGIN
  Person Create (0.6ms)  INSERT INTO "people" ("name", "gender", "dob", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["name", nil], ["gender", nil], ["dob", nil], ["created_at", "2022-05-27 13:51:37.899836"], ["updated_at", "2022-05-27 13:51:37.899836"]]
  TRANSACTION (6.8ms)  COMMIT                   
 => true 

 3.0.0 :002 > person.checkbox = 1
 => 1 
 3.0.0 :006 > person.checkbox = true
 => true 
 3.0.0 :007 > person.save
 => false 
=end
