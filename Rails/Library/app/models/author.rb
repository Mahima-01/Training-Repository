class Author < ApplicationRecord
  has_many :books
end

=begin
# collection_singular_ids=(ids)
The collection_singular_ids method returns an array of the ids of the objects in the collection. 
3.0.0 :109 > book = author.id
 => 1000049 
3.0.0 :111 > author = book1.id
 => 18 
3.0.0 :112 > author = book2.id
 => 17 
s
# collection.clear
The collection.clear method removes all objects from the collection according to the strategy specified by the dependent option. 
If no option is given, it follows the default strategy. 
The default strategy for has_many :through associations is delete_all, and for has_many associations is to set the foreign keys to NULL.
3.0.0 :108 > author.books.clear
  Book Update All (0.7ms)  UPDATE "books" SET "author_id" = $1, "lock_version" = COALESCE("lock_version", 0) + $2 WHERE "books"."author_id" = $3  [["author_id", nil], ["lock_version", 1], ["author_id", 1000049]]                                                                      
 => []

# collection.empty?
The collection.empty? method returns true if the collection does not contain any associated objects.

3.0.0 :124 > book.author
  Author Load (0.2ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" = $1 LIMIT $2  [["id", 1000045], ["LIMIT", 1]]
 => nil  
3.0.0 :127 > author = book1.author
 => 
#<Author:0x0000559289c65b08 
3.0.0 :129 > author.books.empty?
 => false
3.0.0 :131 > author = book2.author
 => 
#<Author:0x0000559289c65b08  
3.0.0 :132 > author.books.empty?
 => false 
=end