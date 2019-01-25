# frozen_string_literal: true

class BeerWishlist < ApplicationRecord
  belongs_to :user
  has_many :fav_beers, dependent: :destroy
  has_many :beers, through: :fav_beers
  validates :fav_beers, length: 2
end
