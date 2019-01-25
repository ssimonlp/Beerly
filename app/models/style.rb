# frozen_string_literal: true

# == Schema Information
#
# Table name: styles
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  category_id :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


class Style < ApplicationRecord
  belongs_to :category
  has_many :beers, dependent: :destroy
end
