require 'rails_helper'

RSpec.describe Dummy, type: :model do
  it "is valid if name, email present" do
    dummy = Dummy.new(name: "Ram")
    expect(dummy).to be_valid
  end
end