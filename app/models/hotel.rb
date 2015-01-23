class Hotel < ActiveRecord::Base
  belongs_to :user
  has_many :rooms, dependent: :destroy
  has_many :room_availabilities, through: :rooms, dependent: :destroy
  has_many :bookings, through: :rooms, dependent: :destroy
  reverse_geocoded_by :latitude, :longitude
  mount_uploader :image, ImageUploader
  validate :image_size
  validates_presence_of :name, :image, :address, :description, :latitude, :longitude

  private

    def image_size
      if image.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
