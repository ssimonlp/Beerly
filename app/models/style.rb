class Style < ApplicationRecord
  belongs_to :category
  has_many :beers
end
