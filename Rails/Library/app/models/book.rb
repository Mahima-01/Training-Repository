class Book < ApplicationRecord
#  belongs_to :author, touch: true
#validates :title, presence: true, on: :create
validates :title, presence: true, on: :update
#after_save :printing , unless: :title?, if: Proc.new{ self.persisted?}
after_update :printing, unless: [:title?]
#before_destroy :printing
belongs_to :user
  def printing
    print "Callback run here \n "
  end

  def title?
    if title.blank?
      true
    else
      false
    end
  end
end


=begin
# Conditional Callbacks
As with validations, we can also make the calling of a callback method conditional on the satisfaction of a given predicate. 
We can do this using the :if and :unless options, which can take a symbol, a Proc or an Array. 
You may use the :if option when you want to specify under which conditions the callback should be called. 
If you want to specify the conditions under which the callback should not be called, then you may use the :unless option.

1. Using :if and :unless with a Symbol
2. Using :if and :unless with a Proc
3. Using both :if and :unless

3.0.0 :001 > book = Book.create(title: 'Zoology')
/home/itsacheckmate/Training-Repository/Rails/Library/app/models/book.rb:4: warning: key :if is duplicated and overwritten on line 4
  TRANSACTION (0.1ms)  BEGIN
  Book Create (0.3ms)  INSERT INTO "books" ("title", "author", "created_at", "updated_at", "price", "lock_version", "author_id") VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING "id"  [["title", "Zoology"], ["author", nil], ["created_at", "2022-06-22 07:20:14.859839"], ["updated_at", "2022-06-22 07:20:14.859839"], ["price", nil], ["lock_version", 0], ["author_id", nil]]
Callback run here           
   TRANSACTION (0.4ms)  COMMIT
 =>                         
#<Book:0x00007f30d4a5db40  

3.0.0 :001 > book = Book.create(title: 'Geography')
  TRANSACTION (0.1ms)  BEGIN
  Book Create (0.3ms)  INSERT INTO "books" ("title", "author", "created_at", "updated_at", "price", "lock_version", "author_id") VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING "id"  [["title", "Geography"], ["author", nil], ["created_at", "2022-06-22 07:22:16.823891"], ["updated_at", "2022-06-22 07:22:16.823891"], ["price", nil], ["lock_version", 0], ["author_id", nil]]
Callback run here 
   TRANSACTION (0.4ms)  COMMIT
 => 
#<Book:0x00007f3dd4a60ef0

3.0.0 :006 > Book.find_by(id: 35)
  Book Load (0.1ms)  SELECT "books".* FROM "books" WHERE "books"."id" = $1 LIMIT $2  [["id", 35], ["LIMIT", 1]]
 =>                                                                                                                                                      
#<Book:0x000055d8933762e0                                                                                                                                
 id: 35,                                                                                                                                                 
 title: "Geography",                                                                                                                                     
 author: nil,                                                                                                                                            
 created_at: Wed, 22 Jun 2022 07:21:34.696949000 UTC +00:00,                                                                                             
 updated_at: Wed, 22 Jun 2022 07:21:34.696949000 UTC +00:00,                                                                                             
 price: nil,                                            
 lock_version: 0,                                       
 author_id: nil> 

3.0.0 :008 > book = Book.find_by(id: 35)
  Book Load (0.2ms)  SELECT "books".* FROM "books" WHERE "books"."id" = $1 LIMIT $2  [["id", 35], ["LIMIT", 1]]
 =>                                                         
#<Book:0x000055d89337c348

3.0.0 :009 > book.update(title: "Civics")
  TRANSACTION (0.2ms)  BEGIN
  Book Update (0.3ms)  UPDATE "books" SET "title" = $1, "updated_at" = $2, "lock_version" = $3 WHERE "books"."id" = $4 AND "books"."lock_version" = $5  [["title", "Civics"], ["updated_at", "2022-06-22 07:30:59.813954"], ["lock_version", 1], ["id", 35], ["lock_version", 0]]
  TRANSACTION (6.6ms)  COMMIT  
 => true 

3.0.0 :001 > book = Book.new
 => #<Book:0x00007fae207a3458 id: nil, title: nil, author: nil, created_at: nil, updated_at: nil, price: nil, lock_version: 0, author_id: nil> 
3.0.0 :002 > book = Book.find_by(id: 35)
  Book Load (0.8ms)  SELECT "books".* FROM "books" WHERE "books"."id" = $1 LIMIT $2  [["id", 35], ["LIMIT", 1]]
 =>                                                           
#<Book:0x00007fae20711af8                                     
...                                                           
3.0.0 :003 > book
 => 
#<Book:0x00007fae20711af8                                     
 id: 35,                                                      
 title: "Civics",                                             
 author: nil,                                                 
 created_at: Wed, 22 Jun 2022 07:21:34.696949000 UTC +00:00,
 updated_at: Wed, 22 Jun 2022 07:30:59.813954000 UTC +00:00,
 price: nil,
 lock_version: 1,
 author_id: nil> 

3.0.0 :004 > book.update(title: "History")
  TRANSACTION (0.2ms)  BEGIN
  Book Update (0.8ms)  UPDATE "books" SET "title" = $1, "updated_at" = $2, "lock_version" = $3 WHERE "books"."id" = $4 AND "books"."lock_version" = $5  [["title", "History"], ["updated_at", "2022-06-22 07:34:19.835603"], ["lock_version", 2], ["id", 35], ["lock_version", 1]]
  TRANSACTION (6.7ms)  COMMIT
 => true 

3.0.0 :002 > book = Book.find_by(id: 28)
  Book Load (0.3ms)  SELECT "books".* FROM "books" WHERE "books"."id" = $1 LIMIT $2  [["id", 28], ["LIMIT", 1]]
 =>               
#<Book:0x00007f91b47c7a20
...
3.0.0 :003 > book
 => 
#<Book:0x00007f91b47c7a20
 id: 28,                 
 title: "Zoology",       
 author: nil,            
 created_at: Tue, 21 Jun 2022 17:07:05.799236000 UTC +00:00,
 updated_at: Tue, 21 Jun 2022 17:07:05.799236000 UTC +00:00,
 price: nil,
 lock_version: 0,
 author_id: nil> 

3.0.0 :004 > book.update(title: "Hindi")
  TRANSACTION (0.2ms)  BEGIN
  Book Update (0.4ms)  UPDATE "books" SET "title" = $1, "updated_at" = $2, "lock_version" = $3 WHERE "books"."id" = $4 AND "books"."lock_version" = $5  [["title", "Hindi"], ["updated_at", "2022-06-22 07:38:56.246259"], ["lock_version", 1], ["id", 28], ["lock_version", 0]]
Callback run here 
   TRANSACTION (6.5ms)  COMMIT
 => true 

=end