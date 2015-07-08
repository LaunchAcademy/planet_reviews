require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :planet do
    sequence(:name) { |n| "Planet near AlphaCentuari-#{n}" }
    user
  end
end
