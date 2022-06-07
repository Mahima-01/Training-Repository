class Book < ApplicationRecord
  belongs_to :author, primary_key: 'guid'
  belongs_to :author, inverse_of: :books
end


=begin
:primary_key
By convention, Rails assumes that the id column is used to hold the primary key of its tables. 
By convention, all database tables in rails have a primary-key of the id column.
If, for some odd reason (eg you've got a legacy database), your table uses a different primary key to id... you use the primary_key call to tell rails what it is.
The :primary_key option allows you to specify a different column.

:inverse_of
The :inverse_of option specifies the name of the has_many or has_one association that is the inverse of this association.
=end