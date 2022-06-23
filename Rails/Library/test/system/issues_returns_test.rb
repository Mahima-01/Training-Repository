require "application_system_test_case"

class IssuesReturnsTest < ApplicationSystemTestCase
  setup do
    @issues_return = issues_returns(:one)
  end

  test "visiting the index" do
    visit issues_returns_url
    assert_selector "h1", text: "Issues returns"
  end

  test "should create issues return" do
    visit issues_returns_url
    click_on "New issues return"

    fill_in "Book", with: @issues_return.book_id
    fill_in "Issue date", with: @issues_return.issue_date
    fill_in "Return date", with: @issues_return.return_date
    fill_in "Student", with: @issues_return.student_id
    click_on "Create Issues return"

    assert_text "Issues return was successfully created"
    click_on "Back"
  end

  test "should update Issues return" do
    visit issues_return_url(@issues_return)
    click_on "Edit this issues return", match: :first

    fill_in "Book", with: @issues_return.book_id
    fill_in "Issue date", with: @issues_return.issue_date
    fill_in "Return date", with: @issues_return.return_date
    fill_in "Student", with: @issues_return.student_id
    click_on "Update Issues return"

    assert_text "Issues return was successfully updated"
    click_on "Back"
  end

  test "should destroy Issues return" do
    visit issues_return_url(@issues_return)
    click_on "Destroy this issues return", match: :first

    assert_text "Issues return was successfully destroyed"
  end
end
