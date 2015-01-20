class RoomAvailability < ActiveRecord::Base
  belongs_to :room
  has_one :hotel, through: :room
  enum hours: [:three, :six, :twelve]
end
