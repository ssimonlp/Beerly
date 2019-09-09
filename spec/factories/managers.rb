# == Schema Information
#
# Table name: managers
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#

FactoryBot.define do
  password = Faker::Internet.password(6)

  factory :manager do
    email { Faker::Internet.email }
    password { password }
    password_confirmation { password }
    confirmed_at { Time.now }

    trait :not_verified do
      confirmed_at { nil }
    end
  end
end