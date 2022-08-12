require 'rails_helper'
RSpec.describe 'Creating a new student', type: :system do
  it 'adds new student' do
    visit root_path
    click_on 'New Student'
    fill_in 'Name', :with => 'Mitali Sharma'
    fill_in 'Email', :with => 'abc@abc.com'
    click_on 'Create Student'
    expect(page).to have_content 'Mitali Sharma'
  end
end