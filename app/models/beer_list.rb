class BeerList < ApplicationRecord

  scope :archived, -> { where(is_archived: true) }
  scope :up, -> { where(is_archived: false) }
  scope :draft, -> { where(bottle_price: nil) }
  scope :bottle, -> { where(pint_price: nil) }

  belongs_to :beer
  belongs_to :bar
  has_one :manager, through: :bar 
end
