class Room < ActiveRecord::Base
  has_many :room_availabilities, dependent: :destroy
  has_many :bookings, dependent: :destroy
  belongs_to :hotel
  mount_uploader :image, ImageUploader
  validate :image_size
  validates_presence_of :name, :description, :image

  hstore_accessor :extra_info,
    internet: :boolean,
    tv: :boolean,
    sofa: :boolean,
    air: :boolean,
    breakfast: :boolean


  private

    def image_size
      if image.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end
