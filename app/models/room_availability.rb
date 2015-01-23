class RoomAvailability < ActiveRecord::Base
  belongs_to :room
  has_one :hotel, through: :room, dependent: :destroy
  validates :price, numericality: { greater_than: 1000 }
  validate :date_after_now

  HOURS = [3,6,12]

  scope :availables, ->(arrival_time) { where("start >= ? AND available = ?", arrival_time, true) }
  scope :rooms_near_to, ->(coordinates, distance) { joins(:hotel).merge(Hotel.near(coordinates, distance)).select("room_availabilities.*").includes(:hotel) }

  def date_after_now
    errors.add(:base, "Availability date should be in the future") if DateTime.now > self.start
  end
end
