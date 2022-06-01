=begin
class User < ApplicationRecord
  validates :last_name, presence: true, if: :admin? 
  def admin?
    !first_name.blank?
  end
end
=end

class User < ApplicationRecord
  validates :first_name, presence: true, if: :admin? 
  def admin?
    !last_name.blank?
  end
end

=begin
5.1 Using a Symbol with :if and :unless
You can associate the :if and :unless options with a symbol corresponding to the name of a method that will get called right before validation happens. 
This is the most commonly used option.
3.0.0 :001 > user = User.new
 => #<User:0x0000555dce0f2860 id: nil, first_name: nil, last_name: nil, created_at: nil, updated_at: nil> 
3.0.0 :002 > user.first_name = 'Raman'
 => "Raman" 
3.0.0 :003 > user.valid?
 => false 
3.0.0 :004 > user = User.new
 => #<User:0x00007f0018a589c0 id: nil, first_name: nil, last_name: nil, created_at: nil, updated_at: nil> 
3.0.0 :005 > user.valid?
 => true 
 3.0.0 :002 > user.last_name = 'Sharma'
 => "Sharma" 
3.0.0 :003 > user.valid?
 => false 
3.0.0 :004 > user = User.new
 => #<User:0x000055e6d2f3c9d8 id: nil, first_name: nil, last_name: nil, created_at: nil, updated_at: nil> 
3.0.0 :005 > user.valid?
 => true 
=end