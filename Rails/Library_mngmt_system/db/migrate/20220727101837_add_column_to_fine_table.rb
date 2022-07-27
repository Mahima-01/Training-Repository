class AddColumnToFineTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :fines, :issue_returns, foreign_key: true
    add_reference :fines, :student, foreign_key: true
  end
end
