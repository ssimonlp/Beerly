class Bar < ApplicationRecord
  belongs_to :manager
  has_many :beers, through: :beer_lists

end
