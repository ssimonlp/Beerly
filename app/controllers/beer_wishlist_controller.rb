class BeerWishlistController < ApplicationController
  before_action :check_wishlist
  def show
    @beer_wishlist = BeerWishlist.find_by(user_id: current_user.id)
  end
  private
    def check_wishlist
      if BeerWishlist.find_by(user_id: current_user.id) == nil
        BeerWishlist.create(user_id: current_user.id)
      end
    end
end
