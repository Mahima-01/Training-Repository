require 'rails_helper'

RSpec.describe 'Updating a user', type: :system do
  it 'valid inputs' do
    student = Student.create!(name: 'Vijay')
    visit edit_student_path(id: student.id)
    fill_in 'Name', with: 'Vinay'
    click_on 'Update Student'
    visit students_path
    expect(page).to have_content('Vinay')
  end
end