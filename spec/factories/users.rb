FactoryBot.define do
  factory :user do
    sequence(:email){ |n| "foo#{n}@example.com" }
  end
end
