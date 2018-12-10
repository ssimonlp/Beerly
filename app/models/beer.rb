class Beer < ApplicationRecord
  belongs_to :brewery
  belongs_to :category
  belongs_to :style
  has_many :bars, through: :beer_lists

  def self.search(term)
    if term
      where('name ILIKE ?', "%#{term}%")
    end
  end
  
end
