require 'rails_helper'
RSpec.describe "Student", type: :request do
  it "request list of all students" do
    student = Student.create(name: "Test student")
    get students_path
    expect(response).to be_successful
    expect(response.body).to include("Test student")
  end
end