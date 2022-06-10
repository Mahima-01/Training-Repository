class User < ApplicationRecord
  has_many :students, class_name: "User", foreign_key: "teacher_id"

  belongs_to :teacher, class_name: "User", optional:true
end

=begin
#  Existence of Objects:
If you simply want to check for the existence of the object there's a method called exists?. 
This method will query the database using the same query as find, but instead of returning an object or collection of objects 
it will return either true or false.

3.0.0 :029 > User.exists?(1)
  User Exists? (0.3ms)  SELECT 1 AS one FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]
 => true 
3.0.0 :030 > User.exists?(8)
  User Exists? (0.8ms)  SELECT 1 AS one FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 8], ["LIMIT", 1]]
 => true  

# The exists? method also takes multiple values, but the catch is that it will return true if any one of those records exists.
3.0.0 :032 > User.exists?(id: [2,4])
  User Exists? (0.3ms)  SELECT 1 AS one FROM "users" WHERE "users"."id" IN ($1, $2) LIMIT $3  [["id", 2], ["id", 4], ["LIMIT", 1]]
 => true 
3.0.0 :033 > User.exists?(id: [10,11])
  User Exists? (0.3ms)  SELECT 1 AS one FROM "users" WHERE "users"."id" IN ($1, $2) LIMIT $3  [["id", 10], ["id", 11], ["LIMIT", 1]]
 => false 

3.0.0 :034 > User.exists?(first_name: 'Mahima')
  User Exists? (0.3ms)  SELECT 1 AS one FROM "users" WHERE "users"."first_name" = $1 LIMIT $2  [["first_name", "Mahima"], ["LIMIT", 1]]
 => true 
3.0.0 :035 > User.where(first_name: 'Mridula').exists?
  User Exists? (0.6ms)  SELECT 1 AS one FROM "users" WHERE "users"."first_name" = $1 LIMIT $2  [["first_name", "Mridula"], ["LIMIT", 1]]
 => true 
3.0.0 :036 > User.where(first_name: 'Ryan').exists?
  User Exists? (0.7ms)  SELECT 1 AS one FROM "users" WHERE "users"."first_name" = $1 LIMIT $2  [["first_name", "Ryan"], ["LIMIT", 1]]
 => false 
3.0.0 :037 > User.exists?
  User Exists? (0.5ms)  SELECT 1 AS one FROM "users" LIMIT $1  [["LIMIT", 1]]
 => true  


# You can also use any? and many? 
to check for existence on a model or relation. 
many? will use SQL count to determine if the item exists.
3.0.0 :038 > User.any?
  User Exists? (0.3ms)  SELECT 1 AS one FROM "users" LIMIT $1  [["LIMIT", 1]]
 => true 
3.0.0 :039 > User.many?
  User Count (0.8ms)  SELECT COUNT(*) FROM (SELECT 1 AS one FROM "users" LIMIT $1) subquery_for_count  [["LIMIT", 2]]
 => true 

=end
