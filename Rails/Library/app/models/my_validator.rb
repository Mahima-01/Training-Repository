class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.first_name.start_with? 'M'
      record.errors.add :base, "Need a name starting with M please!"
    end
  end
end


=begin
# Custom validator:
Custom validators are classes that inherit from ActiveModel::Validator. 
These classes must implement the validate method which takes a record as an argument and performs the validation on it. 
The custom validator is called using the validates_with method.
3.0.0 :001 > user = User.new
 => #<User:0x00007f6790995440 id: nil, first_name: nil, last_name: nil, created_at: nil, updated_at: nil> 
3.0.0 :002 > user.first_name = "Mahima"
 => "Mahima" 
3.0.0 :003 > user.valid?
 => true 
3.0.0 :004 > user.first_name = "Raman"
 => "Raman" 
3.0.0 :005 > user.valid?
 => false 
3.0.0 :006 > user.first_name = "Megha"
 => "Megha" 
3.0.0 :007 > user.valid?
 => true 
3.0.0 :008 > user.first_name = "Sam"
 => "Sam" 
3.0.0 :009 > user.valid?
 => false 
=end

