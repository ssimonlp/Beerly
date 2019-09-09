FactoryBot.define do
  factory :style do
    name { Faker::Beer.style }
    category
  end
end