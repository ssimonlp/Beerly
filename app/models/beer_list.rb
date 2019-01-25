# frozen_string_literal: true

# == Schema Information
#
# Table name: beer_lists
#
#  id              :bigint(8)        not null, primary key
#  pint_price      :decimal(, )
#  half_pint_price :decimal(, )
#  bottle_price    :decimal(, )
#  beer_id         :bigint(8)
#  bar_id          :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  is_archived     :boolean          default(FALSE)
#


class BeerList < ApplicationRecord
  scope :archived, -> { where(is_archived: true) }
  scope :up, -> { where(is_archived: false) }
  scope :draft, -> { where(bottle_price: nil) }
  scope :bottle, -> { where(pint_price: nil) }

  belongs_to :beer
  belongs_to :bar
  has_one :manager, through: :bar
end
