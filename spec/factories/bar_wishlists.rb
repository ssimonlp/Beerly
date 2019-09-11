# == Schema Information
#
# Table name: bar_wishlists
#
#  id         :bigint           not null, primary key
#  bar_id     :bigint
#  user_id    :bigint
#  is_visited :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :bar_wishlist do
    is_visited { false }
    
    bar
    user

    trait :visited do
      is_visited { true }
    end
  end
end