class Bar < ApplicationRecord
  belongs_to :manager
  has_many :beers, through: :beer_lists
  
  # Geocoding
  geocoded_by :address
  after_validation :geocode
end
