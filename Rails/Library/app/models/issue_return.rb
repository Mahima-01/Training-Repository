class IssueReturn < ApplicationRecord
  validate :issue_date_cannot_be_in_the_past
  enum :status, [:price, :status]
  def issue_date_cannot_be_in_the_past
    if issue_date.present? && issue_date < Date.today
      errors.add(:issue_date, "can't be in the past")
    end
  end
end

=begin
# Enum:
Enums
An enum lets you define an Array of values for an attribute and refer to them by name. 
The actual value stored in the database is an integer that has been mapped to one of the values.
3.0.0 :001 > IssueReturn.price
  IssueReturn Load (8.3ms)  SELECT "issue_returns".* FROM "issue_returns" WHERE "issue_returns"."status" = $1  [["status", 0]]
 => []
3.0.0 :002 > IssueReturn.status
  IssueReturn Load (0.7ms)  SELECT "issue_returns".* FROM "issue_returns" WHERE "issue_returns"."status" = $1  [["status", 1]]
 => [] 
3.0.0 :003 > IssueReturn.not_status
  IssueReturn Load (0.3ms)  SELECT "issue_returns".* FROM "issue_returns" WHERE "issue_returns"."status" != $1  [["status", 1]]
 => [] 

=end