class Bar < ApplicationRecord
  include PgSearch
  belongs_to :manager
  has_one :beer_list
  has_many :beers, through: :beer_list
  
  
  # Geocoding
  geocoded_by :address
  after_validation :geocode
  
  validates :name, presence: true
  validates :address, presence: true
  validates :photo, presence: true
  validates :opening_time, presence: true
  validates :happy_hours, presence: true
  validates :description, presence: true

   pg_search_scope :search_by_beer, :associated_against => {
    :beers => [:name]
  }
end
