FactoryBot.define do
  sequence :email do |n|
    "user_1#{n}@example.com"
  end

  factory :user do
    email { FactoryBot.generate(:email) }
    password {'password'}
    password_confirmation {'password'}
  end
end
