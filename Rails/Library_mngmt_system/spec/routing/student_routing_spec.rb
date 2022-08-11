require "rails_helper"

RSpec.describe "routes for Students", type: :routing do
  it "routes /students to the students controller" do
    expect(get("/students")).to route_to("students#index")
  end
end