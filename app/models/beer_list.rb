class BeerList < ApplicationRecord
  belongs_to :beer
  belongs_to :bar
  has_one :manager, through: :bar 
end
