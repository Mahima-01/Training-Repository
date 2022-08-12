RSpec.describe 25 do
  it 'can test for multiple matchers' do
    # expect(subject).to be_odd
    # expect(subject).to be > 20
  
    expect(subject).to be_odd.and be > 20
  end
end

  