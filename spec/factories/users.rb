# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  sequence :email do | n |
    "user#{n}#{n}#{n}@gmail.com"
  end

  sequence :name do | n |
    "user#{n}"
  end

  factory :user do
    email { generate :email }
    name  { generate :name }
    password "password123"
  end
end
