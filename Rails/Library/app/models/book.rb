class Book < ApplicationRecord
  belongs_to :author
end

=begin
A belongs_to association sets up a connection with another model, 
such that each instance of the declaring model "belongs to" one instance of the other model.
=end
