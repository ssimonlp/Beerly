# frozen_string_literal: true

module BarWishlistsHelper
  def to_visit(barwishlist)
    !barwishlist.is_visited
  end
end
