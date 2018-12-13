class Bar < ApplicationRecord
  include PgSearch
  belongs_to :manager
  has_many :beer_lists
  has_many :beers, through: :beer_lists
  has_many :bar_wishlists
  
 
  # Geocoding
  geocoded_by :address
  after_validation :geocode
  
  validates :name, presence: true
  validates :address, presence: true
  #validates :photo, presence: true
  #validates :opening_time, presence: true
  #validates :happy_hours, presence: true
  #validates :description, presence: true

   pg_search_scope :search_by_beer, 
   associated_against: {
    beers: [:name]
   }, 
   using: {
    tsearch: {
      prefix: true
    }
  }
  
  def self.search(beer, location)
    json = []
    bars = Bar.search_by_beer(beer).near(location)
    bars.each do |bar|
      json << {id: bar['id'], name: bar["name"], address: bar["address"], photo: bar["photo"], latitude: bar["latitude"], longitude: bar["longitude"]}
    end
    json
  end
end
