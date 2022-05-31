class Author < ApplicationRecord
  validates :email, uniqueness: true, on: :create
  validates :title, presence: true
end


=begin
3.0.0 :005 > author.save
  TRANSACTION (0.4ms)  BEGIN
  Author Exists? (67.1ms)  SELECT 1 AS one FROM "authors" WHERE "authors"."email" = $1 LIMIT $2  [["email", "raj12@1gmail.com"], ["LIMIT", 1]]
  Author Create (7.5ms)  INSERT INTO "authors" ("title", "created_at", "updated_at", "lock_version", "email") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["title", "Mathematics"], ["created_at", "2022-05-31 14:02:16.558081"], ["updated_at", "2022-05-31 14:02:16.558081"], ["lock_version", 0], ["email", "raj12@1gmail.com"]]
  TRANSACTION (1.0ms)  COMMIT                                 
 => true   
 3.0.0 :009 > author.email = 'raj12@1gmail.com'
 => "raj12@1gmail.com" 
 3.0.0 :004 > author.errors.messages
 => {:email=>["has already been taken"], :title=>["can't be blank"]} 
 =end
 