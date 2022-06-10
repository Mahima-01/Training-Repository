class User < ApplicationRecord
  has_many :students, class_name: "User", foreign_key: "teacher_id"

  belongs_to :teacher, class_name: "User", optional:true
end

=begin
# Calculations:

#Count
If you want to see how many records are in your model's table you could call Customer.count and that will return the number.
3.0.0 :073 > student = User.count
  User Count (0.6ms)  SELECT COUNT(*) FROM "users"
 => 5                                                                 
3.0.0 :074 > student
 => 5 
3.0.0 :075 > student = User.where(first_name: 'Mahima').count
  User Count (0.3ms)  SELECT COUNT(*) FROM "users" WHERE "users"."first_name" = $1  [["first_name", "Mahima"]]
 => 1 
3.0.0 :076 > student =  User.includes("first_name").where(first_name: 'Mridula').count
  User Count (0.4ms)  SELECT COUNT(*) FROM "users" WHERE "users"."first_name" = $1  [["first_name", "Mridula"]]
 => 1 

3.0.0 :001 > user = User.new
 => #<User:0x00007fc79cb8a658 id: nil, first_name: nil, last_name: nil, created_at: nil, updated_at: nil, type: nil, teacher_id: nil> 
# Average
If you want to see the average of a certain number in one of your tables you can call the 
average method on the class that relates to the table
3.0.0 :007 > student =  User.average(:id)
  User Average (0.4ms)  SELECT AVG("users"."id") FROM "users"
 => 0.3e1 
This will return a number (possibly a floating-point number such as 3.14159265) representing the average value in the field.

# Minimum
If you want to find the minimum value of a field in your table you can call the minimum method on the class that relates to the table.
3.0.0 :005 > student =  User.minimum(:id)
  User Minimum (0.4ms)  SELECT MIN("users"."id") FROM "users"
 => 1 

# Maximum
If you want to find the maximum value of a field in your table you can call the maximum method on the class that relates to the table.
3.0.0 :006 > student =  User.maximum(:id)
  User Maximum (1.0ms)  SELECT MAX("users"."id") FROM "users"
 => 5

# Sum
If you want to find the sum of a field for all records in your table you can call the sum method on the class that relates to the table
3.0.0 :008 > student =  User.sum(:id)
  User Sum (0.9ms)  SELECT SUM("users"."id") FROM "users"
 => 15 

=end
