class Bar < ApplicationRecord
  belongs_to :manager
  has_many :beers, trough: :beer_lists

end
