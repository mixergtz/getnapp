# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hotel do
    name "MyString"
    image "MyString"
    address "MyString"
    description "MyText"
    latitude 1.5
    longitude 1.5
  end
end
