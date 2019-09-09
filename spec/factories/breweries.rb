# == Schema Information
#
# Table name: breweries
#
#  id         :bigint           not null, primary key
#  name       :string
#  verified   :boolean          default(FALSE)
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :brewery do
    name { Faker::Beer.brand }
    verified { false }
    image_url { Faker::Avatar.image }

    trait :verified do
      verified { true }
    end
  end
end
