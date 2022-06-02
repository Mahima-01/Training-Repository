class Author < ApplicationRecord
  has_many :books, dependent: :destroy
end

class Book < ApplicationRecord
  belongs_to :author
end

=begin
A belongs_to association sets up a connection with another model, 
such that each instance of the declaring model "belongs to" one instance of the other model.

A has_many association is similar to has_one, but indicates a one-to-many connection with another model. 
You'll often find this association on the "other side" of a belongs_to association. 
This association indicates that each instance of the model has zero or more instances of another model.
=end
