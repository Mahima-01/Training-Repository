class User < ApplicationRecord
  has_many :students, class_name: "User", foreign_key: "teacher_id"

  belongs_to :teacher, class_name: "User", optional:true

end

=begin
# Finding by Sql:
1.select_all
2.Pluck
3.ids

# select_all:
3.0.0 :086 >  User.connection.select_all("SELECT first_name, created_at FROM users WHERE id = '1'").to_a
   (0.3ms)  SELECT first_name, created_at FROM users WHERE id = '1'
 => [{"first_name"=>"Mary", "created_at"=>2022-06-09 13:33:43.42781 UTC}]   
 
# Pluck:
pluck
pluck can be used to query single or multiple columns from the underlying table of a model. 
It accepts a list of column names as an argument and returns an array of values of the specified columns with the corresponding data type.
3.0.0 :083 >  User.where(first_name: 'Nina').pluck(:id)
  User Pluck (0.6ms)  SELECT "users"."id" FROM "users" WHERE "users"."first_name" = $1  [["first_name", "Nina"]]
 => [9] 
Unlike select, pluck directly converts a database result into a Ruby Array, without constructing ActiveRecord objects. 
This can mean better performance for a large or frequently-run query.
3.0.0 :087 >  User.pluck(:id)
  User Pluck (0.6ms)  SELECT "users"."id" FROM "users"
 => [1, 4, 2, 5, 3, 6, 7, 8, 9, 10, 11] 
3.0.0 :088 >  User.pluck(:id, :first_name)
  User Pluck (0.5ms)  SELECT "users"."id", "users"."first_name" FROM "users"
 => [[1, "Mary"], [4, "Manu"], [2, "Mridul"], [5, "Mahima"], [3, "Mridula"], [6, "Andy"], [7, "Raman"], [8, "Aryan"], [9, "Nina"], [10, nil], [11, "Larry"]] 
 
limit does not work with pluck, it raises an error.
3.0.0 :091 > User.pluck(:first_name).limit(4)
  User Pluck (0.5ms)  SELECT "users"."first_name" FROM "users"
(irb):91:in `<main>': undefined method `limit' for ["Mary", "Manu", "Mridul", "Mahima", "Mridula", "Andy", "Raman", "Aryan", "Nina", nil, "Larry"]:Array (NoMethodError) 

3.0.0 :092 > User.limit(2).pluck(:first_name)
  User Pluck (0.1ms)  SELECT "users"."first_name" FROM "users" LIMIT $1  [["LIMIT", 2]]
 => ["Mary", "Manu"] 

3.0.0 :097 > assoc.unscope(:includes).pluck(:id)
  User Pluck (0.4ms)  SELECT "users"."id" FROM "users"
 => [1, 4, 2, 5, 3, 6, 7, 8, 9, 10, 11]

# ids
ids can be used to pluck all the IDs for the relation using the table's primary key.
3.0.0 :098 > User.ids
  User Pluck (0.7ms)  SELECT "users"."id" FROM "users"
 => [1, 4, 2, 5, 3, 6, 7, 8, 9, 10, 11] 

                                            
 
 
=end
