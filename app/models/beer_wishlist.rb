# frozen_string_literal: true

# == Schema Information
#
# Table name: beer_wishlists
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BeerWishlist < ApplicationRecord
  belongs_to :user
  has_many :fav_beers, dependent: :destroy
  has_many :beers, through: :fav_beers
  validates :fav_beers, length: { maximum: 2 }
end
