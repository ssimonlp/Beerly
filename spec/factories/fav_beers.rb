# == Schema Information
#
# Table name: fav_beers
#
#  id               :bigint           not null, primary key
#  beer_wishlist_id :bigint
#  beer_id          :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryBot.define do
  factory :fav_beer do
    beer
    beer_wishlist
  end
end