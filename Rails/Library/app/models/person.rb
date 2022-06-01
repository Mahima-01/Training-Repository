class Person < ApplicationRecord
  validate do |person|
    errors.add :base, :invalid, message: "This person is invalid because ..."
  end
end

=begin
# errors[:base]:
You can add errors that are related to the object's state as a whole, instead of being related to a specific attribute. 
You can add errors to :base when you want to say that the object is invalid, no matter the values of its attributes.
3.0.0 :001 > person = Person.new
 => #<Person:0x00007fe7789d13d8 id: nil, name: nil, gender: nil, dob: nil, created_at: nil, updated_at: nil> 
3.0.0 :002 > person.valid?
 => false 
3.0.0 :003 > person.errors.messages
 => {:base=>["This person is invalid because ..."]} 
 3.0.0 :005 > person.errors.where(:base).first.full_message
 => "This person is invalid because ..." 
=end
