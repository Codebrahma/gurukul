# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :user_email do |n|
    "user-mail-#{n}@example.com"
  end

  sequence :user_name do |n|
    "Tester #{n}"
  end
  
  factory :user do
    email { generate :user_email }
    name { generate :user_name }
    password "12345678"
  end
end
