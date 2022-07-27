class CreateIssueReturns < ActiveRecord::Migration[7.0]
  def change
    create_table :issue_returns do |t|
      t.datetime :issue_time
      t.datetime :return_time

      t.timestamps
    end
  end
end
