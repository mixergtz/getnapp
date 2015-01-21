# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :booking do
    room nil
    arrival "2015-01-21 12:18:45"
    price 1
    status 1
    hours 1
  end
end
