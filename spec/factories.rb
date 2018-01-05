FactoryBot.define do
  factory :user do
    name 'Test User'
    sequence(:email) { |n| "testuser-#{n}@email.com".downcase }
    password 'password'
  end

  factory :admin, class: 'User' do
    name 'Admin User'
    sequence(:email) { |n| "adminuser-#{n}@email.com".downcase }
    password 'password'
    admin true
  end
end
