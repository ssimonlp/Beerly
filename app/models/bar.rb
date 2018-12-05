class Bar < ApplicationRecord
  belongs_to :manager
  has_many :beers, through: :beer_lists
  
  # Geocoding
  geocoded_by :address
  after_validation :geocode
  
  validates :name, presence: true
  validates :address, presence: true
  validates :photo, presence: true
  validates :opening_time, presence: true
  validates :happy_hours, presence: true
  validates :description, presence: true
end
