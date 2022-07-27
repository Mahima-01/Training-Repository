class AddColumnToIssueReturnTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :issue_returns, :book, foreign_key: true
    add_reference :issue_returns, :student, foreign_key: true
  end
end
