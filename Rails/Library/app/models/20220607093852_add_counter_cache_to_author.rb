class AddCounterCacheToAuthor < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :books_count, :integer, default: 0
    Author.find_each { |author| Author.reset_counters(author.id, :books) }
  end
end

=begin
:counter_cache
itsacheckmate@itsacheckmate:~/Training-Repository/Rails/Library$ rails g migration add_counter_cache_to_author author_count:integer
      invoke  active_record                                                        
      create    db/migrate/20220607093852_add_counter_cache_to_author.rb 
itsacheckmate@itsacheckmate:~/Training-Repository/Rails/Library$ rails db:migrate
== 20220607093852 AddCounterCacheToAuthor: migrating ==========================
-- add_column(:authors, :books_count, :integer, {:default=>0})
   -> 0.0012s
== 20220607093852 AddCounterCacheToAuthor: migrated (0.0576s) =================


3.0.0 :001 >     Author.find_each { |author| Author.reset_counters(author.id, :books) }
  Author Load (6.2ms)  SELECT "authors".* FROM "authors" ORDER BY "authors"."id" ASC LIMIT $1  [["LIMIT", 1000]]
  Author Load (0.1ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" = $1 LIMIT $2  [["id", 1000025], ["LIMIT", 1]]
  Book Count (0.3ms)  SELECT COUNT(*) FROM "books" WHERE "books"."author_id" = $1  [["author_id", 1000025]]
  Author Update All (1.4ms)  UPDATE "authors" SET "books_count" = $1, "lock_version" = COALESCE("lock_version", 0) + $2 WHERE "authors"."id" = $3  [["books_count", 0], ["lock_version", 1], ["id", 1000025]]
  Author Load (0.1ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" = $1 LIMIT $2  [["id", 1000026], ["LIMIT", 1]]
  Book Count (0.1ms)  SELECT COUNT(*) FROM "books" WHERE "books"."author_id" = $1  [["author_id", 1000026]]
  Author Update All (0.7ms)  UPDATE "authors" SET "books_count" = $1, "lock_version" = COALESCE("lock_version", 0) + $2 WHERE "authors"."id" = $3  [["books_count", 0], ["lock_version", 1], ["id", 1000026]]
  Author Load (0.1ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" = $1 LIMIT $2  [["id", 1000027], ["LIMIT", 1]]
  Book Count (0.1ms)  SELECT COUNT(*) FROM "books" WHERE "books"."author_id" = $1  [["author_id", 1000027]]
  Author Update All (0.4ms)  UPDATE "authors" SET "books_count" = $1, "lock_version" = COALESCE("lock_version", 0) + $2 WHERE "authors"."id" = $3  [["books_count", 0], ["lock_version", 1], ["id", 1000027]]
  Author Load (0.1ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" = $1 LIMIT $2  [["id", 1000028], ["LIMIT", 1]]
  Book Count (0.1ms)  SELECT COUNT(*) FROM "books" WHERE "books"."author_id" = $1  [["author_id", 1000028]]
  Author Update All (0.3ms)  UPDATE "authors" SET "books_count" = $1, "lock_version" = COALESCE("lock_version", 0) + $2 WHERE "authors"."id" = $3  [["books_count", 3], ["lock_version", 1], ["id", 1000028]]
  Author Load (0.1ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" = $1 LIMIT $2  [["id", 1000029], ["LIMIT", 1]]
  Book Count (0.1ms)  SELECT COUNT(*) FROM "books" WHERE "books"."author_id" = $1  [["author_id", 1000029]]
  Author Update All (0.4ms)  UPDATE "authors" SET "books_count" = $1, "lock_version" = COALESCE("lock_version", 0) + $2 WHERE "authors"."id" = $3  [["books_count", 0], ["lock_version", 1], ["id", 1000029]]
  Author Load (0.1ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" = $1 LIMIT $2  [["id", 1000030], ["LIMIT", 1]]
  Book Count (0.1ms)  SELECT COUNT(*) FROM "books" WHERE "books"."author_id" = $1  [["author_id", 1000030]]
  Author Update All (0.5ms)  UPDATE "authors" SET "books_count" = $1, "lock_version" = COALESCE("lock_version", 0) + $2 WHERE "authors"."id" = $3  [["books_count", 0], ["lock_version", 1], ["id", 1000030]]
  Author Load (0.0ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" = $1 LIMIT $2  [["id", 1000031], ["LIMIT", 1]]
  Book Count (0.1ms)  SELECT COUNT(*) FROM "books" WHERE "books"."author_id" = $1  [["author_id", 1000031]]
  Author Update All (0.4ms)  UPDATE "authors" SET "books_count" = $1, "lock_version" = COALESCE("lock_version", 0) + $2 WHERE "authors"."id" = $3  [["books_count", 1], ["lock_version", 1], ["id", 1000031]]
  Author Load (0.1ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" = $1 LIMIT $2  [["id", 1000032], ["LIMIT", 1]]
  Book Count (0.1ms)  SELECT COUNT(*) FROM "books" WHERE "books"."author_id" = $1  [["author_id", 1000032]]
  Author Update All (0.5ms)  UPDATE "authors" SET "books_count" = $1, "lock_version" = COALESCE("lock_version", 0) + $2 WHERE "authors"."id" = $3  [["books_count", 1], ["lock_version", 1], ["id", 1000032]]
  Author Load (0.1ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" = $1 LIMIT $2  [["id", 1000033], ["LIMIT", 1]]
  Book Count (0.1ms)  SELECT COUNT(*) FROM "books" WHERE "books"."author_id" = $1  [["author_id", 1000033]]
  Author Update All (0.5ms)  UPDATE "authors" SET "books_count" = $1, "lock_version" = COALESCE("lock_version", 0) + $2 WHERE "authors"."id" = $3  [["books_count", 0], ["lock_version", 1], ["id", 1000033]]
  Author Load (0.2ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" = $1 LIMIT $2  [["id", 1000034], ["LIMIT", 1]]
  Book Count (0.1ms)  SELECT COUNT(*) FROM "books" WHERE "books"."author_id" = $1  [["author_id", 1000034]]
  Author Update All (0.4ms)  UPDATE "authors" SET "books_count" = $1, "lock_version" = COALESCE("lock_version", 0) + $2 WHERE "authors"."id" = $3  [["books_count", 0], ["lock_version", 1], ["id", 1000034]]
 => nil 
 
 3.0.0 :009 > author = Author.find(1000028)
  Author Load (0.6ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" = $1 LIMIT $2  [["id", 1000028], ["LIMIT", 1]]
 =>                                                 
#<Author:0x0000557e6cd8c530  

3.0.0 :010 > author.books.size
 => 3
=end