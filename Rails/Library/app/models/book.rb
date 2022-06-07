class Book < ApplicationRecord
  belongs_to :author, class_name: "Author", foreign_key: "author_id"
end


=begin
# :foreign_key
By convention, Rails assumes that the column used to hold the foreign key on this model is the name of the association with the suffix _id added. 
The :foreign_key option lets you set the name of the foreign key directly:
In any case, Rails will not create foreign key columns for you. You need to explicitly define them as part of your migrations.
=end