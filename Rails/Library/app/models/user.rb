class User < ApplicationRecord
  has_many :students, class_name: "User", foreign_key: "teacher_id"

  belongs_to :teacher, class_name: "User", optional:true
end

=begin
# Conditions:
The where method allows you to specify conditions to limit the records returned, representing the WHERE-part of the SQL statement. 
Conditions can either be specified as a string, array, or hash.

#  Pure String Conditions:
If you'd like to add conditions to your find, you could just specify them in there, just like User.where("first_name = 'Mahima'"). 
This will find all books where the title field value is 'Introduction to Algorithms'.
3.0.0 :002 > student = User.where("first_name = 'Mahima'")
  User Load (1.0ms)  SELECT "users".* FROM "users" WHERE (first_name = 'Mahima')
 =>                                                                               
[#<User:0x00007f7f8888b490 
3.0.0 :004 > student
 => 
[#<User:0x00007f7f8888b490                                  
  id: 5,                                                    
  first_name: "Mahima",                                     
  last_name: nil,                                           
  updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,
  type: nil,                                                
  teacher_id: 7>] 

3.0.0 :008 > student = User.where("first_name = 'Mridula'")
  User Load (0.3ms)  SELECT "users".* FROM "users" WHERE (first_name = 'Mridula')
 =>                                                                          
[#<Admin:0x000055a9f8d86e70                                                  
...                                                                          
3.0.0 :009 > student
 => 
[#<Admin:0x000055a9f8d86e70                                                  
  id: 3,                                                                     
  first_name: "Mridula",                                                     
  last_name: nil,                                                            
  created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,                
  updated_at: Thu, 09 Jun 2022 14:32:46.658374000 UTC +00:00,                
  type: "Admin",                                                             
  teacher_id: 4>]   

# Array Conditions:
3.0.0 :021 >  params = Hash.new
 => {} 
3.0.0 :023 >  params[:first_name] = Integer
 => Integer 
3.0.0 :024 >  params[:first_name]= "Mary"
 => "Mary" 
3.0.0 :025 > student = User.where("first_name = ?", params[:first_name])
  User Load (0.5ms)  SELECT "users".* FROM "users" WHERE (first_name = 'Mary')
 =>                                                                          
[#<User:0x000055a9fb4d5fa8                                                   
...   
3.0.0 :026 >  params[:first_name]= "Mihir"
 => "Mihir" 
3.0.0 :027 > student = User.where("first_name = ?", params[:first_name])
  User Load (0.3ms)  SELECT "users".* FROM "users" WHERE (first_name = 'Mihir')
 => [] 
3.0.0 :031 >  params[:first_name]= "Aryan"
 => "Aryan" 
3.0.0 :032 > student = User.where("first_name = ?", params[:first_name])
  User Load (0.6ms)  SELECT "users".* FROM "users" WHERE (first_name = 'Aryan')
 =>                                                
[#<User:0x00007f7f88574450 
3.0.0 :037 > student = User.where("first_name = ?", params[:first_name])
  User Load (0.4ms)  SELECT "users".* FROM "users" WHERE (first_name = 'Mahima')
 =>                                                                                                    
[#<User:0x00007f7f88aa7dc8 
3.0.0 :038 >  params[:first_name]= "Nina"
 => "Nina" 
3.0.0 :039 > student = User.where("first_name = ?", params[:first_name])
  User Load (0.3ms)  SELECT "users".* FROM "users" WHERE (first_name = 'Nina')
 =>                                                                                                    
[#<User:0x000055a9fb2d24b8 
Placeholder Conditions
Similar to the (?) replacement style of params, 
you can also specify keys in your conditions string along with a corresponding keys/values hash:
3.0.0 :040 > User.where("created_at >= :start_date AND created_at <= :end_date",
3.0.0 :041 >   {start_date: params[:created_at], end_date: params[:updated_at]})
  User Load (0.4ms)  SELECT "users".* FROM "users" WHERE (created_at >= NULL AND created_at <= NULL)
 => []  

# 2 Conditions That Use LIKE:
3.0.0 :045 > User.where("first_name LIKE ?", params[:first_name] + "%")
  User Load (0.4ms)  SELECT "users".* FROM "users" WHERE (first_name LIKE 'Nina%')
 =>                                                                     
[#<User:0x000055a9f93ae730                                              
  id: 9,                                                                
  first_name: "Nina",                                                   
  last_name: nil,                                                       
  created_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,           
  updated_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,           
  type: nil,                                                            
  teacher_id: nil>] 
3.0.0 :046 >  params[:first_name]= "Aryan"
 => "Aryan" 
3.0.0 :047 > User.where("first_name LIKE ?", params[:first_name] + "%")
  User Load (0.4ms)  SELECT "users".* FROM "users" WHERE (first_name LIKE 'Aryan%')
 => 
[#<User:0x000055a9fae1b230
  id: 8,
  first_name: "Aryan",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:27:50.715381000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:27:50.715381000 UTC +00:00,
  type: nil,
  teacher_id: nil>]


# Hash Conditions
Active Record also allows you to pass in hash conditions which can increase the readability of your conditions syntax. 
With hash conditions, you pass in a hash with keys of the fields you want qualified and the values of how you want to qualify them:

Only equality, range, and subset checking are possible with Hash conditions.
Equality Conditions:
3.0.0 :048 > User.where(first_name: true)
  User Load (0.1ms)  SELECT "users".* FROM "users" WHERE "users"."first_name" = $1  [["first_name", "t"]]
 => [] 
3.0.0 :049 > author = Author.first
})  Author Load (1.4ms)  SELECT "authors".* FROM "authors" ORDER BY "authors"."id" ASC LIMIT $1  [["LIMIT", 1]]
 =>                            
#<Author:0x00007f7f88a04ba0    
...                            
3.0.0 :050 > Book.where(author: author)
3.0.0 :051 > Author.joins(:books).where(books: { author: author })
  Author Load (1.6ms)  SELECT "authors".* FROM "authors" INNER JOIN "books" ON "books"."author_id" = "authors"."id" WHERE "books"."author_id" = $1  [["author_id", 1000025]]     
 => []
# Range Conditions:
3.0.0 :052 > Book.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)
  Book Load (0.2ms)  SELECT "books".* FROM "books" WHERE "books"."created_at" BETWEEN $1 AND $2  [["created_at", "2022-06-11 18:30:00"], ["created_at", "2022-06-12 18:30:00"]]
 => [] 

# Subset Conditions
If you want to find records using the IN expression you can pass an array to the conditions hash:
3.0.0 :061 > User.where(id: [1,7])
  User Load (0.4ms)  SELECT "users".* FROM "users" WHERE "users"."id" IN ($1, $2)  [["id", 1], ["id", 7]]
 =>                                
[#<User:0x000055a9fb4eca78         
  id: 1,                          
  first_name: "Mary",             
  last_name: nil,                 
  created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
  type: nil,                      
  teacher_id: nil>,               
 #<User:0x000055a9fb4ec9b0        
  id: 7,                          
  first_name: "Raman",            
  last_name: nil,                 
  created_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  type: nil,
  teacher_id: nil>] 

3.0.0 :062 > User.where(id: [2])
  User Load (0.1ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1  [["id", 2]]
 => 
[#<Reader:0x00007f7f8847b800
  id: 2,
  first_name: "Mridul",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:19:26.000191000 UTC +00:00,
  type: "Reader",
  teacher_id: 1>] 

# NOT Conditions
NOT SQL queries can be built by where.not:
3.0.0 :063 > User.where.not(id: [1,3])
  User Load (0.7ms)  SELECT "users".* FROM "users" WHERE "users"."id" NOT IN ($1, $2)  [["id", 1], ["id", 3]]
 =>                                                                              
[#<Reader:0x000055a9fb0e8710                                                     
  id: 4,                                                                         
  first_name: "Manu",                                                            
  last_name: nil,                                                                
  created_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,                    
  updated_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,                    
  type: "Reader",                                                                
  teacher_id: nil>,                                                              
 #<Reader:0x000055a9fb0e85f8                                                     
  id: 2,                                                                         
  first_name: "Mridul",                                                          
  last_name: nil,                                                                
  created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:19:26.000191000 UTC +00:00,
  type: "Reader",
  teacher_id: 1>,
 #<User:0x000055a9fb0e8198
  id: 5,
  first_name: "Mahima",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,
  type: nil,
  teacher_id: 7>,
 #<User:0x000055a9fb0e80d0
  id: 6,
  first_name: "Andy",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x000055a9fb0e8008
  id: 7,
  first_name: "Raman",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x000055a9fb0e3f30
  id: 8,
  first_name: "Aryan",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:27:50.715381000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:27:50.715381000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x000055a9fb0e3e68
  id: 9,
  first_name: "Nina",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,
  type: nil,
  teacher_id: nil>] 

3.0.0 :064 > User.where.not(id: [8])
  User Load (0.2ms)  SELECT "users".* FROM "users" WHERE "users"."id" != $1  [["id", 8]]
 => 
[#<User:0x000055a9fa66b968
  id: 1,
  first_name: "Mary",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<Reader:0x000055a9fa66b800
  id: 4,
  first_name: "Manu",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  type: "Reader",
  teacher_id: nil>,
 #<Reader:0x000055a9fa66b698
  id: 2,
  first_name: "Mridul",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:19:26.000191000 UTC +00:00,
  type: "Reader",
  teacher_id: 1>,
 #<User:0x000055a9fa66b5a8
  id: 5,
  first_name: "Mahima",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,
  type: nil,
  teacher_id: 7>,
 #<Admin:0x000055a9fa66b418
  id: 3,
  first_name: "Mridula",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:32:46.658374000 UTC +00:00,
  type: "Admin",
  teacher_id: 4>,
 #<User:0x000055a9fa66b288
  id: 6,
  first_name: "Andy",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x000055a9fa669488
  id: 7,
  first_name: "Raman",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x000055a9fa6691b8
  id: 9,
  first_name: "Nina",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,
  type: nil,
  teacher_id: nil>] 

If a query has a hash condition with non-nil values on a nullable column, 
the records that have nil values on the nullable column won't be returned. 
3.0.0 :065 > User.create!(first_name: nil)
3.0.0 :066 > User.where.not(first_name: "Larry")
  TRANSACTION (0.1ms)  BEGIN
  User Create (3.3ms)  INSERT INTO "users" ("first_name", "last_name", "created_at", "updated_at", "type", "teacher_id") VALUES ($1, $2, $3, $4, $5, $6) RETURNING "id"  [["first_name", nil], ["last_name", nil], ["created_at", "2022-06-13 10:21:11.330916"], ["updated_at", "2022-06-13 10:21:11.330916"], ["type", nil], ["teacher_id", nil]]           
  TRANSACTION (0.6ms)  COMMIT              
  User Load (0.4ms)  SELECT "users".* FROM "users" WHERE "users"."first_name" != $1  [["first_name", "Larry"]]
 =>                 

3.0.0 :067 > User.create!(first_name: "Larry")
3.0.0 :068 > User.where.not(first_name: nil)
  TRANSACTION (0.1ms)  BEGIN
  User Create (0.2ms)  INSERT INTO "users" ("first_name", "last_name", "created_at", "updated_at", "type", "teacher_id") VALUES ($1, $2, $3, $4, $5, $6) RETURNING "id"  [["first_name", "Larry"], ["last_name", nil], ["created_at", "2022-06-13 10:23:28.960073"], ["updated_at", "2022-06-13 10:23:28.960073"], ["type", nil], ["teacher_id", nil]]               
  TRANSACTION (6.5ms)  COMMIT                      
  User Load (0.2ms)  SELECT "users".* FROM "users" WHERE "users"."first_name" IS NOT NULL
 => 
[#<User:0x00007f7f8826ccf8
  id: 1,
  first_name: "Mary",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<Reader:0x00007f7f8826cac8
  id: 4,
  first_name: "Manu",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  type: "Reader",
  teacher_id: nil>,
 #<Reader:0x00007f7f8826c8e8
  id: 2,
  first_name: "Mridul",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:19:26.000191000 UTC +00:00,
  type: "Reader",
  teacher_id: 1>,
 #<User:0x00007f7f8826c758
  id: 5,
  first_name: "Mahima",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 14:20:22.722410000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:21:12.488182000 UTC +00:00,
  type: nil,
  teacher_id: 7>,
 #<Admin:0x00007f7f8826c4b0
  id: 3,
  first_name: "Mridula",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:32:46.658374000 UTC +00:00,
  type: "Admin",
  teacher_id: 4>,
 #<User:0x00007f7f8826c2f8
  id: 6,
  first_name: "Andy",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:19:47.704230000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x00007f7f8826c118
  id: 7,
  first_name: "Raman",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x00007f7f88267f78
  id: 8,
  first_name: "Aryan",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:27:50.715381000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:27:50.715381000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x00007f7f88267dc0
  id: 9,
  first_name: "Nina",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x00007f7f88267c80
  id: 11,
  first_name: "Larry",
  last_name: nil,
  created_at: Mon, 13 Jun 2022 10:23:28.960073000 UTC +00:00,
  updated_at: Mon, 13 Jun 2022 10:23:28.960073000 UTC +00:00,
  type: nil,
  teacher_id: nil>] 

# OR Conditions
OR conditions between two relations can be built by calling or on the first relation, and passing the second one as an argument.
3.0.0 :070 > User.where(first_name: 'Nina').or(User.where(id: [1,3]))
  User Load (0.4ms)  SELECT "users".* FROM "users" WHERE ("users"."first_name" = $1 OR "users"."id" IN ($2, $3))  [["first_name", "Nina"], ["id", 1], ["id", 3]]                                                                                         
 =>                                                                                             
[#<User:0x000055a9fb575cd8                                                                      
  id: 1,                                                                                        
  first_name: "Mary",                                                                           
  last_name: nil,                                                                               
  created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,                                   
  updated_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,                                   
  type: nil,                                                                                    
  teacher_id: nil>,                                                                             
 #<Admin:0x000055a9fb575bc0                                                                     
  id: 3,                                                                                        
  first_name: "Mridula",                                                                        
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:32:46.658374000 UTC +00:00,
  type: "Admin",
  teacher_id: 4>,
 #<User:0x000055a9fb575a30
  id: 9,
  first_name: "Nina",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,
  type: nil,
  teacher_id: nil>] 

3.0.0 :071 > User.where(first_name: 'Nina').or(User.where(id: [1]))
  User Load (0.3ms)  SELECT "users".* FROM "users" WHERE ("users"."first_name" = $1 OR "users"."id" = $2)  [["first_name", "Nina"], ["id", 1]]
 => 
[#<User:0x00007f7f88593210
  id: 1,
  first_name: "Mary",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
  type: nil,
  teacher_id: nil>,
 #<User:0x000055a9fa465038
  id: 9,
  first_name: "Nina",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,
  type: nil,
  teacher_id: nil>] 

3.0.0 :073 > User.where(first_name: 'Nina').where(id: [1])
  User Load (0.2ms)  SELECT "users".* FROM "users" WHERE "users"."first_name" = $1 AND "users"."id" = $2  [["first_name", "Nina"], ["id", 1]]
 => []  

3.0.0 :074 > User.where(first_name: 'Nina').where(id: [9])
  User Load (0.5ms)  SELECT "users".* FROM "users" WHERE "users"."first_name" = $1 AND "users"."id" = $2  [["first_name", "Nina"], ["id", 9]]
 =>                                                                                                  
[#<User:0x000055a9fa603138                                                                           
  id: 9,                                                                                             
  first_name: "Nina",                                                                                
  last_name: nil,                                                                                    
  created_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,                                    
  updated_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,                                    
  type: nil,                                                                                     
  teacher_id: nil>]

# AND Conditions
AND conditions can be built by chaining where conditions.
3.0.0 :075 > User.where(first_name: 'Nina').and(User.where(id: [1]))
  User Load (0.3ms)  SELECT "users".* FROM "users" WHERE "users"."first_name" = $1 AND "users"."id" = $2  [["first_name", "Nina"], ["id", 1]]
 => [] 
3.0.0 :076 > User.where(first_name: 'Nina').and(User.where(id: [9]))
  User Load (0.3ms)  SELECT "users".* FROM "users" WHERE "users"."first_name" = $1 AND "users"."id" = $2  [["first_name", "Nina"], ["id", 9]]
 =>                                                                                                  
[#<User:0x00007f7f889f4318                                                                           
  id: 9,                                                                                             
  first_name: "Nina",                                                                                
  last_name: nil,                                                                                    
  created_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,                                        
  updated_at: Fri, 10 Jun 2022 12:31:35.940569000 UTC +00:00,                                        
  type: nil,                                                                                         
  teacher_id: nil>]   

3.0.0 :077 > User.where(first_name: 'Raman').and(User.where(id: [7]))
  User Load (0.7ms)  SELECT "users".* FROM "users" WHERE "users"."first_name" = $1 AND "users"."id" = $2  [["first_name", "Raman"], ["id", 7]]
 => 
[#<User:0x000055a9fb030d68
  id: 7,
  first_name: "Raman",
  last_name: nil,
  created_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  updated_at: Fri, 10 Jun 2022 12:20:16.397939000 UTC +00:00,
  type: nil,
  teacher_id: nil>] 


3.0.0 :079 > User.where(id: [1, 2]).and(User.where(id: [2, 3]))
  User Load (0.4ms)  SELECT "users".* FROM "users" WHERE "users"."id" IN ($1, $2) AND "users"."id" IN ($3, $4)  [["id", 1], ["id", 2], ["id", 2], ["id", 3]]                                                                          
 =>                                                                          
[#<Reader:0x00007f7f88932b00                                                 
  id: 2,                                                                     
  first_name: "Mridul",                                                      
  last_name: nil,                                                            
  created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,                
  updated_at: Thu, 09 Jun 2022 14:19:26.000191000 UTC +00:00,                
  type: "Reader",                                                            
  teacher_id: 1>]  

3.0.0 :080 > User.where(id: [1, 2, 4]).and(User.where(id: [2, 3, 4, 5]))
  User Load (0.3ms)  SELECT "users".* FROM "users" WHERE "users"."id" IN ($1, $2, $3) AND "users"."id" IN ($4, $5, $6, $7)  [["id", 1], ["id", 2], ["id", 4], ["id", 2], ["id", 3], ["id", 4], ["id", 5]]
 => 
[#<Reader:0x00007f7f889d3be0
  id: 2,
  first_name: "Mridul",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 14:19:26.000191000 UTC +00:00,
  type: "Reader",
  teacher_id: 1>,
 #<Reader:0x00007f7f889d3a78
  id: 4,
  first_name: "Manu",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  type: "Reader",
  teacher_id: nil>] 

=end
