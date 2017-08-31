class Gig < ApplicationRecord
  belongs_to :user
  validates :category, presence: true

  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end
