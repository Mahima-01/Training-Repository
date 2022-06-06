class Book < ApplicationRecord
  belongs_to :author
end

=begin
create_association(attributes = {})
The create_association method returns a new object of the associated type. 
This object will be instantiated from the passed attributes, the link through this object's foreign key will be set, and, once it passes all of the validations specified on the associated model, the associated object will be saved.
3.0.0 :036 > book2 = Book.new
 => #<Book:0x00007f83d87c8bd0 id: nil, title: nil, author: nil, created_at: nil, updated_at: nil, price: nil, lock_version: 0, author_id: nil> 
3.0.0 :037 > book.save
 => true 
3.0.0 :038 > book = book2.build_author(name: 'Joe', email: 'joe12@gmail.com')
 => #<Author:0x0000561699b71208 id: nil, created_at: nil, updated_at: nil, lock_version: 0, email: "joe12@gmail.com", name: "Joe"> 
3.0.0 :039 > book.save
  TRANSACTION (0.3ms)  BEGIN
  Author Create (0.6ms)  INSERT INTO "authors" ("created_at", "updated_at", "lock_version", "email", "name") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["created_at", "2022-06-06 11:53:31.518437"], ["updated_at", "2022-06-06 11:53:31.518437"], ["lock_version", 0], ["email", "joe12@gmail.com"], ["name", "Joe"]]
  TRANSACTION (1.7ms)  COMMIT                    
 => true 
3.0.0 :040 > book2.author
 => 
#<Author:0x0000561699b71208                                         
 id: 1000026,                                                       
 created_at: Mon, 06 Jun 2022 11:53:31.518437000 UTC +00:00,        
 updated_at: Mon, 06 Jun 2022 11:53:31.518437000 UTC +00:00,        
 lock_version: 0,                                                   
 email: "joe12@gmail.com",                                          
 name: "Joe">   
3.0.0 :041 > book = book2.create_author(name: 'Joe', email: 'joe12@gmail.com')
  TRANSACTION (0.2ms)  BEGIN
  Author Create (0.5ms)  INSERT INTO "authors" ("created_at", "updated_at", "lock_version", "email", "name") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["created_at", "2022-06-06 12:02:11.380130"], ["updated_at", "2022-06-06 12:02:11.380130"], ["lock_version", 0], ["email", "joe12@gmail.com"], ["name", "Joe"]]
  TRANSACTION (8.3ms)  COMMIT                                            
 =>                                                                      
#<Author:0x00007f83d8ef5a48                                              
3.0.0 :042 > book2.author
 => 
#<Author:0x00007f83d8ef5a48                                              
 id: 1000027,                                                            
 created_at: Mon, 06 Jun 2022 12:02:11.380130000 UTC +00:00,             
 updated_at: Mon, 06 Jun 2022 12:02:11.380130000 UTC +00:00,             
 lock_version: 0,                                                   
 email: "joe12@gmail.com",                                          
 name: "Joe">                         
=end

