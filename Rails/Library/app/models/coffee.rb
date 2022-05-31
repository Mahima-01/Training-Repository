class Coffee < ApplicationRecord
  validates :brand, length: { is: 9 }, allow_blank: true
end

=begin
# allow_blank:
The :allow_blank option is similar to the :allow_nil option. 
This option will let validation pass if the attribute's value is blank?, like nil or an empty string.
3.0.0 :002 > coffee = Coffee.new
 => #<Coffee:0x000055c1104b1118 id: nil, brand: nil, size: nil, created_at: nil, updated_at: nil> 
3.0.0 :003 > coffee.brand = 'nescafe'
 => "nescafe" 
3.0.0 :004 > coffee.valid?
 => false 
3.0.0 :005 > coffee.brand = 'bru'
 => "bru" 
3.0.0 :006 > coffee.valid?
 => false
3.0.0 :002 > coffee.brand = 'Caffeinee'
 => "Caffeinee" 
3.0.0 :003 > coffee.valid?
 => true 
3.0.0 :004 > coffee.brand = 'Manhattan Coffee'
 => "Manhattan Coffee" 
3.0.0 :005 > coffee.valid?
 => false 
3.0.0 :006 > coffee.brand = nil
 => nil 
3.0.0 :007 > coffee.valid?
 => true 
=end
