FactoryBot.define do
  factory :category do
    name { Faker::Beer.malts }
  end
end