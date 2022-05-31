class Author < ApplicationRecord
  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
end


=begin
# format:
This helper validates the attributes' values by testing whether they match a given regular expression, which is specified using the :with option.
Alternatively, you can require that the specified attribute does not match the regular expression by using the :without option
3.0.0 :005 > author.email = 'raj12@gmail.com'
 => "raj12@gmail.com" 
 3.0.0 :006 > author.valid?
 => true 
 3.0.0 :007 > author.email = 'raj12gmail.com'
 => "raj12gmail.com" 
3.0.0 :008 > author.valid?
 => false 
 3.0.0 :009 > author.email = 'raj12@1gmail.com'
 => "raj12@1gmail.com" 
3.0.0 :010 > author.valid?
 => true 