class Book < ApplicationRecord
  belongs_to :author
end

=begin
A bidirectional relationship is valid in both directions. 
Intersects is an example of a bidirectional relationship.
Active Record will attempt to automatically identify that these two models share a bi-directional association based on the association name. 
In this way, Active Record will only load one copy of the Author object, making your application more efficient and preventing inconsistent data
=end
