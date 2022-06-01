=begin
class User < ApplicationRecord
  validates :first_name, presence: true, if: Proc.new { |user| user.last_name.blank? }
end
class User < ApplicationRecord
  validates :first_name, presence: true, unless: Proc.new { |user| user.last_name.present? }
end
=end
class User < ApplicationRecord
   with_options if: :is_admin? do |admin|
    admin.validates :first_name, length: { minimum: 10 }
    admin.validates :last_name, presence: true
  end
end



=begin
It is possible to associate :if and :unless with a Proc object which will be called. 
Using a Proc object gives you the ability to write an inline condition instead of a separate method. This option is best suited for one-liners.
3.0.0 :003 > user.first_name = 'Rishabh'
 => "Rishabh" 
3.0.0 :004 > user.valid?
 => true 
 3.0.0 :005 > user.first_name = nil
 => nil 
3.0.0 :006 > user.valid?
 => true 
3.0.0 :007 > user.last_name = 'gaur'
 => "gaur" 
3.0.0 :008 > user.valid?
 => true 
3.0.0 :009 > user = User.new
 => #<User:0x00007f85d0a71ec8 id: nil, first_name: nil, last_name: nil, created_at: nil, updated_at: nil> 
3.0.0 :010 > user.valid?
 => false 
=end