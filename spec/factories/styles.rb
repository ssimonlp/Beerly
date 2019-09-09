# == Schema Information
#
# Table name: styles
#
#  id          :bigint           not null, primary key
#  name        :string
#  category_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :style do
    name { Faker::Beer.style }
    category
  end
end
