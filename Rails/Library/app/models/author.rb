class Author < ApplicationRecord
  has_many :books
  has_many :categories
end

=begin
# Method Chaining:
The Active Record pattern implements 
Method Chaining, which allow us to use multiple Active Record methods together in a simple and straightforward way.
3.0.0 :001 > Author.select("email").joins(:books).where("author_id > 0")
  Author Load (0.3ms)  SELECT "authors"."email" FROM "authors" INNER JOIN "books" ON "books"."author_id" = "authors"."id" WHERE (author_id > 0)
 =>                                                                                               
[#<Author:0x000055dc6ecc5e98 id: nil, email: "joe12@gmail.com">,                                  
 #<Author:0x00007fd76413f978 id: nil, email: "joe12@gmail.com">,                                  
 #<Author:0x00007fd76413edc0 id: nil, email: "joe12@gmail.com">,                                  
 #<Author:0x00007fd76413ebb8 id: nil, email: "raj12@gmail.com">,
 #<Author:0x00007fd76413ea28 id: nil, email: "raj12@gmail.com">,
 #<Author:0x00007fd76413e910 id: nil, email: "varun12@gmail.com">,
 #<Author:0x00007fd76413e848 id: nil, email: "mahima12@gmail.com">,
 #<Author:0x00007fd76413e758 id: nil, email: "ram12@gmail.com">,
 #<Author:0x00007fd76413e668 id: nil, email: "raju01@gmail.com">,
 #<Author:0x00007fd76413e5a0 id: nil, email: "jane11@gmail.com">,
 #<Author:0x00007fd76413e4d8 id: nil, email: nil>,
 #<Author:0x00007fd76413e3e8 id: nil, email: nil>] 

3.0.0 :007 > Author.select("email").joins(:books).find_by(name: 'Mahima')
  Author Load (0.3ms)  SELECT "authors"."email" FROM "authors" INNER JOIN "books" ON "books"."author_id" = "authors"."id" WHERE "authors"."name" = $1 LIMIT $2  [["name", "Mahima"], ["LIMIT", 1]]                            
 => nil 

3.0.0 :010 > Author.select("email").joins(:books).find_by(name: 'Varun')
  Author Load (0.5ms)  SELECT "authors"."email" FROM "authors" INNER JOIN "books" ON "books"."author_id" = "authors"."id" WHERE "authors"."name" = $1 LIMIT $2  [["name", "Varun"], ["LIMIT", 1]]                             
 => #<Author:0x000055dc713db8c0 id: nil, email: "varun12@gmail.com"> 
3.0.0 :012 > Author.select("email").joins(:books).find_by(id: '1000038')
  Author Load (0.6ms)  SELECT "authors"."email" FROM "authors" INNER JOIN "books" ON "books"."author_id" = "authors"."id" WHERE "authors"."id" = $1 LIMIT $2  [["id", 1000038], ["LIMIT", 1]]                                                                                                                     
 => #<Author:0x00007fd764659198 id: nil, email: "varun12@gmail.com">                                                                                     
3.0.0 :013 > Author.select("email").joins(:books).find_by(id: '1000035')
  Author Load (0.3ms)  SELECT "authors"."email" FROM "authors" INNER JOIN "books" ON "books"."author_id" = "authors"."id" WHERE "authors"."id" = $1 LIMIT $2  [["id", 1000035], ["LIMIT", 1]]                                                                                                                     
 => nil                                                        
3.0.0 :021 >  Author.select("email").joins(:books).find_by(id: '1000039')
  Author Load (0.6ms)  SELECT "authors"."email" FROM "authors" INNER JOIN "books" ON "books"."author_id" = "authors"."id" WHERE "authors"."id" = $1 LIMIT $2  [["id", 1000039], ["LIMIT", 1]]
 => #<Author:0x000055dc7116b400 id: nil, email: "mahima12@gmail.com"> 

Note that if a query matches multiple records, find_by will fetch only the first one and ignore the others. 
=end
