# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room_availability do
    room nil
    start "2015-01-19 11:16:44"
    hours 1
    available false
    price 1
  end
end
