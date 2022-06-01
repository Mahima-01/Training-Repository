class Persons < ApplicationRecord
  validate do |person|
    errors.add :name, :too_plain, message: "is not cool enough"
  end
end

=begin
# error.add:
The add method creates the error object by taking the attribute, the error type and additional options hash. 
This is useful for writing your own validator.
3.0.0 :002 > person.valid?
  Person Exists? (7.3ms)  SELECT 1 AS one FROM "people" WHERE "people"."id" IS NULL LIMIT $1  [["LIMIT", 1]]                                       
 => false 
 3.0.0 :003 > person.errors.full_messages
 => ["Name is invalid"]
 3.0.0 :005 > person.errors.where(:name).first.type
 => :invalid 
=end
