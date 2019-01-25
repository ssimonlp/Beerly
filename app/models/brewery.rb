# frozen_string_literal: true

# == Schema Information
#
# Table name: breweries
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  verified   :boolean          default(FALSE)
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Brewery < ApplicationRecord
  has_many :beers, dependent: :destroy
end
