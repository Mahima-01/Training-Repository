class Person < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
end

=begin
# errors.clear
The clear method is used when you intentionally want to clear the errors collection. Of course, calling errors.clear upon an invalid object won't actually make it valid: the errors collection will now be empty, 
but the next time you call valid? or any method that tries to save this object to the database, the validations will run again. If any of the validations fail, the errors collection will be filled again.
3.0.0 :001 > person = Person.new
 => #<Person:0x000055c0363fa0d8 id: nil, name: nil, gender: nil, dob: nil, created_at: nil, updated_at: nil> 
3.0.0 :002 > person.valid?
 => false 
3.0.0 :003 > person.errors.messages
 => {:name=>["can't be blank", "is too short (minimum is 3 characters)"]} 
3.0.0 :004 > person.name = 'Raman'
 => "Raman" 
3.0.0 :005 > person.valid?
 => true
3.0.0 :007 > person.errors.clear
 => [] 
3.0.0 :008 > person.errors.empty?
 => true 
# errors.size:
The size method returns the total number of errors for the object
3.0.0 :009 > person.errors.size
 => 0 
3.0.0 :001 > person = Person.new
 => 
#<Person:0x0000564ba5397730
3.0.0 :002 > person.valid?
 => false 
3.0.0 :003 > person.errors.size
 => 2 
=end
