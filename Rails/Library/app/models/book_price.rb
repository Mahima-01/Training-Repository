class BookPrice < ApplicationRecord
  validates :issue_date, comparison: { greater_than: :return_date }
end

=begin
3.0.0 :002 > BookPrice.create(return_date: '25-05-2022', issue_date: Time.now)
  TRANSACTION (0.3ms)  BEGIN
  BookPrice Create (0.9ms)  INSERT INTO "book_prices" ("price", "issue_date", "return_date", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["price", nil], ["issue_date", "2022-05-31"], ["return_date", "2022-05-25"], ["created_at", "2022-05-31 08:53:02.366788"], ["updated_at", "2022-05-31 08:53:02.366788"]]
  TRANSACTION (0.6ms)  COMMIT                                                          
 =>                                                                                    
#<BookPrice:0x0000560cd999af70                                                         
 id: 1,                                                                                
 price: nil,                                                                           
 issue_date: Tue, 31 May 2022,                                                         
 return_date: Wed, 25 May 2022,                                                        
 created_at: Tue, 31 May 2022 08:53:02.366788000 UTC +00:00,                           
 updated_at: Tue, 31 May 2022 08:53:02.366788000 UTC +00:00>   
3.0.0 :007 > BookPrice.create!(issue_date: '25-05-2022', return_date: Time.now)
/home/itsacheckmate/.rvm/gems/ruby-3.0.0/gems/activerecord-7.0.3/lib/active_record/validations.rb:80:in 
raise_validation_error': Validation failed: Issue date must be greater than 2022-05-31 (ActiveRecord::RecordInvalid)                                                          

3.0.0 :002 > BookPrice.create(return_date: '25-05-2022', issue_date: Time.now)
3.0.0 :006 > book.errors.objects.first.full_message
 => "Issue date must be greater than 2022-05-31"
 =end
