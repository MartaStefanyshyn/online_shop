FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "user#{n}@example.com" }
    password "password"
  end

  trait :admin do
  	role "admin"
  end
end