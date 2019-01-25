# frozen_string_literal: true

# == Schema Information
#
# Table name: fav_beers
#
#  id               :bigint(8)        not null, primary key
#  beer_wishlist_id :bigint(8)
#  beer_id          :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#


class FavBeer < ApplicationRecord
  belongs_to :beer
  belongs_to :beer_wishlist
  validates_associated :beer_wishlist
end
