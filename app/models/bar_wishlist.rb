# frozen_string_literal: true

class BarWishlist < ApplicationRecord
  scope :visited, -> { where(is_visited: true) }
  scope :to_visit, -> { where(is_visited: false) }

  belongs_to :bar
  belongs_to :user

  validates :bar_id, presence: true, uniqueness: { scope: :user_id }
end
