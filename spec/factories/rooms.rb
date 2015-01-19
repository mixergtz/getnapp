# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room do
    name "MyString"
    address "MyString"
    description "MyText"
    lat 1.5
    lang 1.5
    rating 1
    image "MyString"
  end
end
