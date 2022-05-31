class Person < ApplicationRecord
  validates :name, inclusion: { in: %w[Mahima Rishabh] }
end


=begin
# inclusion:
It checks the value can only be any of those on the in option.
3.0.0 :001 > person = Person.new
 => #<Person:0x00007effa864cc20 id: nil, name: nil, gender: nil, dob: nil, created_at: nil, updated_at: nil> 
3.0.0 :002 > person.valid?
 => false 
3.0.0 :003 > person.name = "Rishabh"
 => "Rishabh" 
3.0.0 :004 > person.valid?
 => true 
 3.0.0 :005 > person.name = "Lalit"
 => "Lalit" 
3.0.0 :006 > person.valid?
 => false 
=end
