# == Schema Information
#
# Table name: users
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
#  provider               :string
#  uid                    :string
#

OAUTH_PROVIDERS = ['google_oauth2', 'facebook']

FactoryBot.define do
  password = Faker::Internet.password(min_length: 6)

  factory :user do
    email { Faker::Internet.email }
    password { password }
    password_confirmation { password }
    confirmed_at { Time.now }

    trait :not_confirmed do
      confirmed_at { nil }
    end

    trait :from_oauth do
      provider { OAUTH_PROVIDERS.sample }
      uid { Faker::Number.number(digits: 21) }
    end
  end
end