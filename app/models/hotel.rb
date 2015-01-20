class Hotel < ActiveRecord::Base
  has_many :rooms
  has_many :room_availabilities, through: :rooms
  reverse_geocoded_by :latitude, :longitude
end
