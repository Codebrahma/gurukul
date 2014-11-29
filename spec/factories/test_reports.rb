# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :test_report do
    status "MyString"
    user_course nil
    test nil
  end
end
