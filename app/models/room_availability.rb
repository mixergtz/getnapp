class RoomAvailability < ActiveRecord::Base
  belongs_to :room
  enum hours: [:three, :six, :twelve]
end
