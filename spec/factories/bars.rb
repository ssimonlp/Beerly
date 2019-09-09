# == Schema Information
#
# Table name: bars
#
#  id           :bigint           not null, primary key
#  manager_id   :bigint
#  name         :string
#  address      :text
#  photo        :string
#  opening_time :text
#  happy_hours  :text
#  description  :text
#  latitude     :float
#  longitude    :float
#  state        :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  siret        :decimal(14, )
#

FactoryBot.define do
  hours = "#{(rand * 9).round}h - #{((rand * 9) + 10).round}h"
  happy_hours = "#{((rand * 9) + 5).round}h - #{((rand * 9) + 10).round}h"

  factory :bar do
    name { Faker::Team.name }
    address { Faker::Address.street_address }
    photo { Faker::LoremPixel.image }
    opening_time { hours }
    happy_hours { happy_hours }
    description { Faker::TvShows::SouthPark.quote }
    state { true }
    siret { Faker::Number.number(digits: 14) }

    manager

    trait :hidden do
      state { false }
    end
  end
end