require 'rails_helper'
RSpec.describe "students/new", type: :view do
  before(:each) do
    assign(:student, Student.new(
      name: "Jasmine"
    ))
  end
  it "has student name" do
    render
    assert_select "form[action=?][method=?]", students_path, "post" do
    assert_select "input[name=?]", "student[name]"
  end
  end
end