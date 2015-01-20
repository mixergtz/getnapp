class RoomAvailability < ActiveRecord::Base
  belongs_to :room
  has_one :hotel, through: :room
  enum hours: [:three, :six, :twelve]

  scope :availables, ->(arrival_time) { where("start >= ? AND available = ?", arrival_time, true) }
  scope :rooms_near_to, ->(coordinates, distance) { joins(:hotel).merge(Hotel.near(coordinates, distance)).select("room_availabilities.*").includes(:hotel) }
end
