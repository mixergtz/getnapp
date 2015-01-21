class Hotel < ActiveRecord::Base
  has_many :rooms
  has_many :room_availabilities, through: :rooms
  has_many :bookings, through: :rooms
  reverse_geocoded_by :latitude, :longitude
  mount_uploader :image, ImageUploader
  validate :image_size

  private

    def image_size
      if image.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
