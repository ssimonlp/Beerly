# == Schema Information
#
# Table name: beers
#
#  id          :bigint           not null, primary key
#  name        :string
#  image_url   :string
#  description :text
#  abv         :decimal(, )
#  ibu         :decimal(, )
#  verified    :boolean          default(FALSE)
#  category_id :bigint
#  style_id    :bigint
#  brewery_id  :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :beer do
    name { Faker::Beer.name }
    image_url { Faker::Avatar.image }
    description { Faker::Games::Myst.quote }
    abv { (rand * 10).round(2) }
    ibu { (rand * 10).round(2) }
    verified { false }

    category
    style
    brewery

    trait :verified do
      verified { true }
    end

    trait :in_wishlist do
      beer_wishlist
    end
  end
end
