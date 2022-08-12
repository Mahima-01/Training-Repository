FactoryBot.define do
  factory :student do
    sequence(:name) { |n| "MyString#{n + 3}" }
    sequence(:email) { |n| "email#{n + 6}@gmail.com" }
  end
end