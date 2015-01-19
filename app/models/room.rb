class Room < ActiveRecord::Base
  has_many :room_availabilities
end
