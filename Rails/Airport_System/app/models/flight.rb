class Flight < ApplicationRecord
  has_one :aircraft
  has_many :aircrafts
end

=begin
A has_many :through association 
Is often used to set up a many-to-many connection with another model. 
This association indicates that the declaring model can be matched with zero or more instances of another model by proceeding through a third model. 
=end


