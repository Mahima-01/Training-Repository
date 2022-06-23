class CreateIssuesReturns < ActiveRecord::Migration[7.0]
  def change
    create_table :issues_returns do |t|
      t.bigint :student_id
      t.bigint :book_id
      t.date :issue_date
      t.date :return_date

      t.timestamps
    end
  end
end
