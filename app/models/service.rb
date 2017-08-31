class Service < ApplicationRecord
  belongs_to :user
  has_many :service_photos
  has_many :bookings

  validates :service_category, presence: true

  def cover_photo(size)
    if self.service_photos.length > 0
      self.service_photos[0].image.url(size)
    else
      "blank.jpg"
    end
  end
end
