json.extract! issues_return, :id, :student_id, :book_id, :issue_date, :return_date, :created_at, :updated_at
json.url issues_return_url(issues_return, format: :json)
