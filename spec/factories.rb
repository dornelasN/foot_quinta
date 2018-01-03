FactoryBot.define do
  factory :user do
    name 'Test User'
    sequence(:email) { |n| "testuser-#{n}@email.com".downcase }
    password 'password'
  end
end
