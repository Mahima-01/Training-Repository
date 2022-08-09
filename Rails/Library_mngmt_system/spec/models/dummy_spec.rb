require 'rails_helper'

RSpec.describe Dummy, type: :model do
  it "is valid if name, email present" do
    dummy = Dummy.new(name: "Ram")
    expect(dummy).to be_valid
  end
  it "is valid if email present" do
    dummy = FactoryBot.build_stubbed(:dummy)
    expect(dummy.email).to eq("hello@cjav.dev")
  end

end