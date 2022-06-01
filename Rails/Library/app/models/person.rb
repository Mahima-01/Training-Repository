class Person < ApplicationRecord
  validates :name, presence: { strict: true }
end

=begin
# Strict validation:
You can also specify validations to be strict and 
raise ActiveModel::StrictValidationFailed when the object is invalid.
3.0.0 :001 > person = Person.new
 => #<Person:0x00007f4b18917610 id: nil, name: nil, gender: nil, dob: nil, created_at: nil, updated_at: nil> 
 3.0.0 :002 > person.valid?
 /home/itsacheckmate/.rvm/gems/ruby-3.0.0/gems/activemodel-7.0.3/lib/active_model/errors.rb:323:in `add': Name can't be blank (ActiveModel::StrictValidationFailed)
3.0.0 :003 > person.name = 'Raman'
 => "Raman" 
3.0.0 :004 > person.valid?
 => true 
=end
