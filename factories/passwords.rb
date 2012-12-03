# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :password do
    name "My Password"
    description "Some Description"
    password "AnotherSeret"
    category
  end
end
