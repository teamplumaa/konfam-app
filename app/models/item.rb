class Item < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :item_purchases

  validates :category_type, presence: true
  validates :item_type, presence: true

  def cover_photo(size)
    if self.photos.length > 0
      self.photos[0].image.url(size)
    else
      "blank.jpg"
    end
  end
end
