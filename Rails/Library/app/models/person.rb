class Person < ApplicationRecord
  validates :name, length: { maximum: 4 }
  validates :gender, length: { maximum: 5 }
end


=begin
# length:
This helper validates the length of the attributes' values. It provides a variety of options, so you can specify length constraints in different ways:
3.0.0 :005 > person.name = 'Ella'
 => "Ella" 
3.0.0 :006 > person.valid?
 => true
3.0.0 :002 > person.name = 'Ram'
 => "Ram" 
3.0.0 :003 > person.valid?
 => true 
3.0.0 :002 > person.gender = 'Male'
 => "Male" 
3.0.0 :003 > person.valid?
 => true 
3.0.0 :004 > person.gender = 'Female'
 => "Female" 
3.0.0 :005 > person.valid?
 => false 
3.0.0 :004 > person.name = 'Manjeet'
 => "Manjeet" 
3.0.0 :005 > person.valid?
 => false 
=end
