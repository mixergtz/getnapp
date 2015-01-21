class Booking < ActiveRecord::Base
  belongs_to :room
  has_one :hotel, through: :room
  enum status: [:pending, :confirmed, :checked_in, :pending_cancel, :canceled]
end
