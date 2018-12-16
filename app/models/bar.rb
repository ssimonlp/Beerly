# frozen_string_literal: true

class Bar < ApplicationRecord
  include PgSearch
  belongs_to :manager
  has_many :beer_lists, dependent: :destroy
  has_many :beers, through: :beer_lists
  has_many :bar_wishlists, dependent: :destroy

  scope :up, -> { where(state: true) }
  scope :down, -> { where(state: false) }

  validates :manager_id, presence: true, uniqueness: true

  # Geocoding
  geocoded_by :address
  after_validation :geocode

  validates :name, presence: true
  validates :address, presence: true

  pg_search_scope :search_by_beer,
                  associated_against: {
                    beers: [:name]
                  }

  def self.search(beer, location)
    json = []
    bars = Bar.search_by_beer(beer).near(location)
    bars.each do |bar|
      draft_beer = bar.beer_lists.up.draft.include?(beer)
      json << { id: bar['id'], name: bar['name'], address: bar['address'], photo: bar['photo'], latitude: bar['latitude'], longitude: bar['longitude'], draft_number: bar.beer_lists.up.draft.count, draft_beer: draft_beer }
    end
    json
  end

  def self.search_cat(cat, location)
    json = []
    beers = Beer.search_by_category(cat)
    beers.each do |beer|
      bars = Bar.search_by_beer(beer['name']).near(location)
      bars.each do |bar|
        beers = bar.beers.where(category_id: cat)
        beer_arr = []
        beers.each do |beer|
          beer_arr << beer['name']
        end
        json << { id: bar['id'], name: bar['name'], address: bar['address'], photo: bar['photo'], latitude: bar['latitude'], longitude: bar['longitude'], draft_number: bar.beer_lists.up.draft.count, beers: beer_arr.uniq }
      end
    end
    json.uniq
  end
end
