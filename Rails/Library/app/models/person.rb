class Person < ApplicationRecord
  validates :id, uniqueness: true
end


=begin
# uniqueness:
This helper validates that the attribute's value is unique right before the object gets saved. 
It does not create a uniqueness constraint in the database, so it may happen that two different database connections create two records with the same value for a column that you intend to be unique. 
To avoid that, you must create a unique index on that column in your database.
3.0.0 :008 > person.id = 20
 => 20 
3.0.0 :009 > person.valid?
  Person Exists? (0.8ms)  SELECT 1 AS one FROM "people" WHERE "people"."id" = $1 LIMIT $2  [["id", 20], ["LIMIT", 1]]
 => false  
 3.0.0 :002 > person.id = 30
 => 30 
 3.0.0 :004 > person.valid?
 Person Exists? (0.3ms)  SELECT 1 AS one FROM "people" WHERE "people"."id" = $1 AND "people"."id" != $2 LIMIT $3  [["id", 30], ["id", 30], ["LIMIT", 1]]
=> true 
3.0.0 :002 > person.id = 21
 => 21 
3.0.0 :003 > person.valid?
  Person Exists? (0.4ms)  SELECT 1 AS one FROM "people" WHERE "people"."id" = $1 LIMIT $2  [["id", 21], ["LIMIT", 1]]
 => false 
=end
