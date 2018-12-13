class BarWishlist < ApplicationRecord

  scope :visited, -> { where(is_visited: true) }
  scope :to_visit, -> { where(is_visited: false) }

  belongs_to :bar
  belongs_to :user


end

