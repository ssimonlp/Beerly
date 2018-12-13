class Beer < ApplicationRecord
  include PgSearch
  belongs_to :brewery
  belongs_to :category
  belongs_to :style
  belongs_to :beer_wishlist, optional: true
  has_many :bars, through: :beer_lists
  has_many :fav_beers, dependent: :destroy
  pg_search_scope :search_beer, 
    against: :name, 
    using: {
      tsearch: {
        prefix: true
      }
    }

  def self.search(term)
    if term
      where('name ILIKE ?', "%#{term}%")
    end
  end
  
end
