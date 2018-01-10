FactoryBot.define do
  factory :player do
    name 'Player Name'
    position 'Goalkeeper'
    date_of_birth '2018-01-09'
    team 'Under-8'
  end

  factory :post do
    title 'Test Post Title'
    content 'Test post content'
    user nil
    sequence(:created_at) { |n| (n+5).hours.ago }
  end

  factory :most_recent_post, class: 'Post' do
    title 'Most Recent Post Title'
    content 'Most recent post content'
    user nil
    created_at Time.zone.now
  end

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
