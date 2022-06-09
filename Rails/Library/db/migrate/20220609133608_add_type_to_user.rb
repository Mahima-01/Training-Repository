class AddTypeToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :type, :string
  end
end


=begin
# Single Table Inheritance:
One table for all classes.
Shared attributes are there.
The superclass has a 'type' column to determine which subclass belongs to.
In our case User is the superclass and admin and reader are the subclass.
3.0.0 :001 > reader = Reader.new
 => #<Reader:0x00007f02085d1428 id: nil, first_name: nil, last_name: nil, created_at: nil, updated_at: nil, type: "Reader"> 
3.0.0 :003 > reader.save
  TRANSACTION (0.2ms)  BEGIN
  Reader Create (0.4ms)  INSERT INTO "users" ("first_name", "last_name", "created_at", "updated_at", "type") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["first_name", "Manu"], ["last_name", nil], ["created_at", "2022-06-09 13:41:24.118763"], ["updated_at", "2022-06-09 13:41:24.118763"], ["type", "Reader"]]
  TRANSACTION (1.3ms)  COMMIT                                 
 => true 
 3.0.0 :004 > Reader.all
  Reader Load (0.2ms)  SELECT "users".* FROM "users" WHERE "users"."type" = $1  [["type", "Reader"]]
 =>                                                           
[#<Reader:0x0000556afa96f540                                  
  id: 2,                                                      
  first_name: "Mridul",                                       
  last_name: nil,                                             
  created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00, 
  updated_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,
  type: "Reader">,                              
 #<Reader:0x0000556afa96da38                    
  id: 4,                                        
  first_name: "Manu",                           
  last_name: nil,                               
  created_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  type: "Reader">] 

3.0.0 :005 > Admin.all
  Admin Load (0.6ms)  SELECT "users".* FROM "users" WHERE "users"."type" = $1  [["type", "Admin"]]
 =>                                                          
[#<Admin:0x00007f0208438620                                  
  id: 3,                                                     
  first_name: "Mridula",                                     
  last_name: nil,                                            
  created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
  type: "Admin">] 
3.0.0 :006 > User.all
  User Load (0.6ms)  SELECT "users".* FROM "users"
 =>                                                          
[#<User:0x0000556afe08e6e8                                   
  id: 1,                                                    
  first_name: "Mary",                                       
  last_name: nil,                                           
  created_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:33:43.427810000 UTC +00:00,
  type: nil>,                                               
 #<Reader:0x0000556afe08e328                                
  id: 2,                                                    
  first_name: "Mridul",                                     
  last_name: nil,                                           
  created_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:37:34.137831000 UTC +00:00,
  type: "Reader">,
 #<Admin:0x0000556afe08e210
  id: 3,
  first_name: "Mridula",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:38:04.971554000 UTC +00:00,
  type: "Admin">,
 #<Reader:0x0000556afe08e0f8
  id: 4,
  first_name: "Manu",
  last_name: nil,
  created_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  updated_at: Thu, 09 Jun 2022 13:41:24.118763000 UTC +00:00,
  type: "Reader">] 

=end
