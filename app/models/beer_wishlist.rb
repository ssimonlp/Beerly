# frozen_string_literal: true

class BeerWishlist < ApplicationRecord
  belongs_to :user
  has_many :fav_beers
  has_many :beers, through: :fav_beers
  validates_length_of :fav_beers, maximum: 2
end
