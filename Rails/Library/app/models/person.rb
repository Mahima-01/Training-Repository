class Person < ApplicationRecord
  validates :name, presence: true
  validates :name, confirmation: {case_sensitive: false}
  validates :name_confirmation, presence: true
end


=begin
You should use this helper when you have two text fields that should receive exactly the same content. 
For example, you may want to confirm an email address or a password. 
This validation creates a virtual attribute whose name is the name of the field that has to be confirmed with "_confirmation" appended.
3.0.0 :001 > person = Person.new
 => #<Person:0x00005575ec4976b0 id: nil, name: nil, gender: nil, dob: nil, created_at: nil, updated_at: nil> 
3.0.0 :002 > person.name_confirmation = 'Ram'
 => "Ram"
3.0.0 :005 > person.name_confirmation = 'ram'
 => "ram" 
=end
