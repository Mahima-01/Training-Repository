require 'rails_helper'

RSpec.describe Student, type: :model do
  it "checks student validity" do
    student = Student.new
    expect(student).to be_invalid
  end
end
