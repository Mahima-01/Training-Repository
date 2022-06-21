class PrintCallbacks
  def after_commit(record)
    if record.title.blank?
      print "Book Is empty"
    end
    if record.title.blank?
      print "Book title is empty"
    end 
  end
end
class Book < ApplicationRecord
#  belongs_to :author
  after_commit PrintCallbacks.new
end

=begin
#  Callback Classes
Sometimes the callback methods that you'll write will be useful enough to be reused by other models.
Active Record makes it possible to create classes that encapsulate the callback methods, so they can be reused.
Here's an example where we create a class with an after_destroy callback for a PictureFile model:

When declared inside a class, as above, the callback methods will receive the model object as a parameter. 
We can now use the callback class in the model.
Note that we needed to instantiate a new PictureFileCallbacks object, since we declared our callback as an instance method. 
This is particularly useful if the callbacks make use of the state of the instantiated object. Often, however, it will make more sense to declare the callbacks as class methods:

Note: You can declare as many callbacks as you want inside your callback classes.

3.0.0 :001 > book = Book.new
 => #<Book:0x00007f4f9ca05cb0 id: nil, title: nil, author: nil, created_at: nil, updated_at: nil, price: nil, lock_version: 0, author_id: nil> 
itsacheckmate@itsacheckmate:~/Training-Repository/Rails/Library$ rails c
Loading development environment (Rails 7.0.3)                                             
3.0.0 :001 > book = Book.create()
  TRANSACTION (0.1ms)  BEGIN
  Book Create (0.3ms)  INSERT INTO "books" ("title", "author", "created_at", "updated_at", "price", "lock_version", "author_id") VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING "id"  [["title", nil], ["author", nil], ["created_at", "2022-06-21 17:06:22.992808"], ["updated_at", "2022-06-21 17:06:22.992808"], ["price", nil], ["lock_version", 0], ["author_id", nil]]
  TRANSACTION (0.5ms)  COMMIT
Book Is emptyBook title is empty => 
#<Book:0x0000564439231260

3.0.0 :002 > book = Book.create(title: 'Zoology')
  TRANSACTION (0.1ms)  BEGIN
  Book Create (0.2ms)  INSERT INTO "books" ("title", "author", "created_at", "updated_at", "price", "lock_version", "author_id") VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING "id"  [["title", "Zoology"], ["author", nil], ["created_at", "2022-06-21 17:07:05.799236"], ["updated_at", "2022-06-21 17:07:05.799236"], ["price", nil], ["lock_version", 0], ["author_id", nil]]
  TRANSACTION (6.6ms)  COMMIT             
 =>                                       
#<Book:0x0000564438a54b00 
=end