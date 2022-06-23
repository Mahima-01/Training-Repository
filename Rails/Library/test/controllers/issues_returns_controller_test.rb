require "test_helper"

class IssuesReturnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @issues_return = issues_returns(:one)
  end

  test "should get index" do
    get issues_returns_url
    assert_response :success
  end

  test "should get new" do
    get new_issues_return_url
    assert_response :success
  end

  test "should create issues_return" do
    assert_difference("IssuesReturn.count") do
      post issues_returns_url, params: { issues_return: { book_id: @issues_return.book_id, issue_date: @issues_return.issue_date, return_date: @issues_return.return_date, student_id: @issues_return.student_id } }
    end

    assert_redirected_to issues_return_url(IssuesReturn.last)
  end

  test "should show issues_return" do
    get issues_return_url(@issues_return)
    assert_response :success
  end

  test "should get edit" do
    get edit_issues_return_url(@issues_return)
    assert_response :success
  end

  test "should update issues_return" do
    patch issues_return_url(@issues_return), params: { issues_return: { book_id: @issues_return.book_id, issue_date: @issues_return.issue_date, return_date: @issues_return.return_date, student_id: @issues_return.student_id } }
    assert_redirected_to issues_return_url(@issues_return)
  end

  test "should destroy issues_return" do
    assert_difference("IssuesReturn.count", -1) do
      delete issues_return_url(@issues_return)
    end

    assert_redirected_to issues_returns_url
  end
end
