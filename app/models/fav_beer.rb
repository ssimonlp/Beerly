class FavBeer < ApplicationRecord
  belongs_to :beer
  belongs_to :beer_wishlist
  validates_associated :beer_wishlist
end
