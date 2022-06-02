class IssueReturn < ApplicationRecord
  validate :issue_date_cannot_be_in_the_past
  def issue_date_cannot_be_in_the_past
    if issue_date.present? && issue_date < Date.today
      errors.add(:issue_date, "can't be in the past")
    end
  end
end

=begin
3.0.0 :001 > issue = IssueReturn.new
 => #<IssueReturn:0x00007fedc46cf638 id: nil, price: nil, issue_date: nil, return_date: nil, created_at: nil, updated_at: nil> 
 3.0.0 :002 > issue.issue_date = '10-10-2021'
 => "10-10-2021" 
3.0.0 :003 > issue.valid?
 => false 
3.0.0 :004 > issue.errors.messages
 => {:issue_date=>["can't be in the past"]} 
3.0.0 :007 > issue.issue_date = '02-06-2022'
 => "02-06-2022" 
3.0.0 :008 > issue.valid?
 => true 
3.0.0 :009 > issue.issue_date = '04-06-2022'
 => "04-06-2022" 
3.0.0 :010 > issue.valid?
 => true 
3.0.0 :011 > issue.issue_date = '12-12-2021'
 => "12-12-2021" 
3.0.0 :012 > issue.valid?
 => false 
3.0.0 :013 > issue.errors.messages
 => {:issue_date=>["can't be in the past"]} 
=end