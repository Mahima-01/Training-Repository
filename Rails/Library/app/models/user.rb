class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.first_name.start_with? 'M'
      record.errors.add :base, "Need a name starting with M please!"
    end
  end
end

class User <ApplicationRecord
  include ActiveModel::Validations
 # validates :first_name, My: true
  validates_with MyValidator
end

=begin
The custom validator is called using the validates_with method.
# validates_with:
This helper passes the record to a separate class for validation.
The validates_with helper takes a class, or a list of classes to use for validation. There is no default error message for validates_with
validates_with takes the :if, :unless and :on options. If you pass any other options, it will send those options to the validator class as options:
3.0.0 :001 > user = User.new
 => #<User:0x00007f417c9e7928 id: nil, first_name: nil, last_name: nil, created_at: nil, updated_at: nil> 
3.0.0 :002 > user.first_name = "Sam"
 => "Sam" 
3.0.0 :003 > user.valid?
 => false 
 3.0.0 :004 > user.first_name = "Mahima"
 => "Mahima" 
3.0.0 :005 > user.valid?
 => true 
=end
