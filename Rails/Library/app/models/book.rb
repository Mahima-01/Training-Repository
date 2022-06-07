class Book < ApplicationRecord
  belongs_to :author, class_name: "Author"
end


=begin
# :class_name:
If the name of the other model cannot be derived from the association name, you can use the :class_name option to supply the model name.
For ex in book class you have used author but you have not defined any association but using :class_name you have defined the class so it will work.
3.0.0 :049 > book2 = Book.new
 => #<Book:0x000055f653b988c8 id: nil, title: nil, author: nil, created_at: nil, updated_at: nil, price: nil, lock_version: 0, author_id: nil> 
3.0.0 :050 > book = book2.create_author(name: 'Raj', email: 'raj12@gmail.com')
  TRANSACTION (0.2ms)  BEGIN
  Author Create (0.3ms)  INSERT INTO "authors" ("created_at", "updated_at", "lock_version", "email", "name") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["created_at", "2022-06-07 09:18:05.364907"], ["updated_at", "2022-06-07 09:18:05.364907"], ["lock_version", 0], ["email", "raj12@gmail.com"], ["name", "Raj"]]
  TRANSACTION (6.5ms)  COMMIT                    
 =>                                              
#<Author:0x00007f2b646be130 
3.0.0 :052 > book2.save!
  TRANSACTION (0.3ms)  BEGIN
  Book Create (0.3ms)  INSERT INTO "books" ("title", "author", "created_at", "updated_at", "price", "lock_version", "author_id") VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING "id"  [["title", nil], ["author", nil], ["created_at", "2022-06-07 09:18:30.811574"], ["updated_at", "2022-06-07 09:18:30.811574"], ["price", nil], ["lock_version", 0], ["author_id", 1000032]]
  TRANSACTION (6.5ms)  COMMIT                    
 => true  
3.0.0 :054 > author.books
 => 
[#<Book:0x000055f652f45968                       
  id: 7,                                         
  title: nil,                                    
  author: nil,                                   
  created_at: Mon, 06 Jun 2022 13:25:09.703208000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 13:25:09.703208000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000028>,
 #<Book:0x000055f652f457d8
  id: 8,
  title: "bio",
  author: nil,
  created_at: Mon, 06 Jun 2022 13:28:24.587359000 UTC +00:00,
  updated_at: Mon, 06 Jun 2022 13:28:24.587359000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000028>,
 #<Book:0x000055f652f45648
  id: 9,
  title: "Biopic",
  author: nil,
  created_at: Tue, 07 Jun 2022 08:36:00.925894000 UTC +00:00,
  updated_at: Tue, 07 Jun 2022 08:36:00.925894000 UTC +00:00,
  price: nil,
  lock_version: 0,
  author_id: 1000028>] 
=end