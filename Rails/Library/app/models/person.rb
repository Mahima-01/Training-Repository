class Person < ApplicationRecord
  validates :id, absence: true
end



=begin
# absence:
This helper validates that the specified attributes are absent. 
It uses the present? method to check if the value is not either nil or a blank string, that is, a string that is either empty or consists of whitespace.
3.0.0 :004 > person.id = 2
 => 2 
3.0.0 :005 > person.valid?
 => false 
3.0.0 :009 > person.id = nil
 => nil 
3.0.0 :010 > person.valid?
 => true 
3.0.0 :007 > person.errors[:id]
 => ["must be blank"]
=end
