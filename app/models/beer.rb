class Beer < ApplicationRecord
  include PgSearch
  belongs_to :brewery
  belongs_to :category
  belongs_to :style
  has_many :bars, through: :beer_lists
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
