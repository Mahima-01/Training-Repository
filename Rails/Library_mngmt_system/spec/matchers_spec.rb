RSpec.describe "all matchers" do
  it 'allows for aggeregrate checks' do
    [1,3,7].each do |val|
      expect(val).to be_odd
    end
  end
  it "all matchers for the above code aggregrate checks" do
    expect([1,3,7]).to all(be_odd)
    expect([10,200,60]).to all(be_even)
    expect([[],[],[]]).to all(be_empty)
    expect([1,4,0]).to all(be < 9)
  end
  describe [1,3,7] do
    it {is_expected.to all(be_odd)}
    it {is_expected.to all(be < 9)}
  end

  it 'allows for aggeregrate checks' do
    [2,4,8].each do |val|
      expect(val).to be_even
    end
  end
  it "all matchers for the above code aggregrate checks" do
    expect([2,4,8]).to all(be_even)
    expect([9,25,37]).to all(be_odd)
    expect([2,4,7]).to all(be < 9)
  end
  describe [2,4,8] do
    it {is_expected.to all(be_even)}
    it {is_expected.to all(be < 10)}
  end
end