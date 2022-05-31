class Coffee < ApplicationRecord
  validates :size, inclusion: { in: %w(small medium large),
  message: "%{value} is not a valid size" }, allow_nil: true
end


=begin
# allow_nill:
The :allow_nil option skips the validation when the value being validated is nil
3.0.0 :005 > coffee.brand = 'nescafe'
 => "nescafe"
 3.0.0 :006 > coffee.valid?
 => true 
 3.0.0 :007 > coffee.size = 'small'
 => "small" 
3.0.0 :008 > coffee.valid?
 => true 
 3.0.0 :009 > coffee.size = 'extra large'
 => "extra large" 
3.0.0 :010 > coffee.valid?
 => false 
 3.0.0 :011 > coffee.size = nil
 => nil 
3.0.0 :012 > coffee.valid?
 => true 