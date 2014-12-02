# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :sample_name do |n|
    "test #{n}"
  end

  factory :course do
    name { generate :sample_name }
    content "test test test"
    desc Faker::Lorem.paragraph
  end
end
