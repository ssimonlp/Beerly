# == Schema Information
#
# Table name: beer_wishlists
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :beer_wishlist do
    user

    trait :with_one_beer do
      fav_beer
    end

    trait :with_many_beers do
      after(:create) do |beer_wishlist|
        create_list(:fav_beer, 10, beer_wishlist: beer_wishlist)
      end
    end
  end
end