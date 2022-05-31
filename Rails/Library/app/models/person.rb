class Person < ApplicationRecord
  validates :id, numericality: true
  validates :id, numericality: { only_integer: true }
end

=begin
# numericality:
This helper validates that your attributes have only numeric values. 
By default, it will match an optional sign followed by an integer or floating point number.
To specify that only integer numbers are allowed, set :only_integer to true
By default, numericality doesn't allow nil values. You can use allow_nil: true option to permit it.
3.0.0 :007 > person.id = 20 
 => 20 
3.0.0 :008 > person.valid?
 => true 
 3.0.0 :009 > person.id = 20.1 
 => 20.1 
3.0.0 :010 > person.valid?
 => false
 3.0.0 :012 > person.id = 21205679845342r
 => (21205679845342/1) 
3.0.0 :013 > person.valid?
 => false 
=end
