class Person < ApplicationRecord
  validates :name, :id, :gender, presence: true
end

=begin
# presence:
This helper validates that the specified attributes are not empty. 
It uses the blank? method to check if the value is either nil or a blank string, that is, a string that is either empty or consists of whitespace.
3.0.0 :007 > person.name = 'Manjeet'
 => "Manjeet" 
3.0.0 :008 > person.valid?
 => false 
 3.0.0 :014 > person.name = 'Mahima'
 => "Mahima"
 3.0.0 :015 > person.id = 1
 => 1 
 3.0.0 :016 > person.gender = 'Female'
 => "Female" 
 3.0.0 :017 > person.valid?
 => true 
 3.0.0 :034 > person.id = 1
 => 1 
3.0.0 :035 > person.id.blank?
 => false 
=end
