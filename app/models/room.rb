class Room < ActiveRecord::Base
  has_many :room_availabilities
  belongs_to :hotel
end
