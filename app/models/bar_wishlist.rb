# frozen_string_literal: true

# == Schema Information
#
# Table name: bar_wishlists
#
#  id         :bigint           not null, primary key
#  bar_id     :bigint
#  user_id    :bigint
#  is_visited :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BarWishlist < ApplicationRecord
  scope :visited, -> { where(is_visited: true) }
  scope :to_visit, -> { where(is_visited: false) }

  belongs_to :bar
  belongs_to :user

  validates :bar_id, presence: true, uniqueness: { scope: :user_id }
end
