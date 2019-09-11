# == Schema Information
#
# Table name: beer_lists
#
#  id              :bigint           not null, primary key
#  pint_price      :decimal(, )
#  half_pint_price :decimal(, )
#  bottle_price    :decimal(, )
#  beer_id         :bigint
#  bar_id          :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  is_archived     :boolean          default(FALSE)
#


FactoryBot.define do
  factory :beer_list do
    pint_price { (rand * 10).round(2) }
    half_pint_price { (rand * 5).round(2) }
    bottle_price { (rand * 5).round(2) }
    is_archived { false }

    beer
    bar

    trait :archived do
      is_archived { true }
    end
  end
end
