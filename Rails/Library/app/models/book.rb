class Book < ApplicationRecord
  belongs_to :author
end

=begin
A belongs_to association sets up a connection with another model, 
such that each instance of the declaring model "belongs to" one instance of the other model.
association
The association method returns the associated object, if any. If no associated object is found, it returns nil.
3.0.0 :001 > book = Book.new
 => #<Book:0x00007fe4d0971708 id: nil, title: nil, author: nil, created_at: nil, updated_at: nil, price: nil, lock_version: 0> 
3.0.0 :009 > author = Author.new
 => #<Author:0x00007f83d8d13748 id: nil, created_at: nil, updated_at: nil, lock_version: 0, email: nil, name: nil> 
3.0.0 :010 > author.save
  TRANSACTION (0.2ms)  BEGIN
  Author Create (0.2ms)  INSERT INTO "authors" ("created_at", "updated_at", "lock_version", "email", "name") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["created_at", "2022-06-06 11:24:14.191542"], ["updated_at", "2022-06-06 11:24:14.191542"], ["lock_version", 0], ["email", nil], ["name", nil]]
  TRANSACTION (5.5ms)  COMMIT                                                  
 => true   
3.0.0 :011 > book = author.books.new
 => #<Book:0x000056169a228150 id: nil, title: nil, author: nil, created_at: nil, updated_at: nil, price: nil, lock_version: 0, author_id: 1000024> 
3.0.0 :013 > book.save
 => true 
3.0.0 :015 > book.title = 'Mathematics'
 => "Mathematics" 
3.0.0 :016 > book.author
 => 
#<Author:0x00007f83d8d13748                                                    
 id: 1000024,                                                                  
 created_at: Mon, 06 Jun 2022 11:24:14.191542000 UTC +00:00,                   
 updated_at: Mon, 06 Jun 2022 11:24:14.191542000 UTC +00:00,                   
 lock_version: 0,                                                              
 email: nil,                                                                   
 name: nil> 
=end

