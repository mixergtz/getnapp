class Room < ActiveRecord::Base
  has_many :room_availabilities
  has_many :bookings
  belongs_to :hotel
  mount_uploader :image, ImageUploader
  validate :image_size
  validates_presence_of :name, :description, :image

  private

    def image_size
      if image.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end
