class FavBeerController < ApplicationController
  def create
    chosen_beer = Beer.find_by(name: params[:term])
    wishlist = BeerWishlist.find_by(user_id: current_user.id)
    unless wishlist.beers.include?(chosen_beer)
      @fav_beer = FavBeer.new
      @fav_beer.beer_wishlist_id = wishlist.id
      @fav_beer.beer_id = choosen_beer.id
      @fav_beer.save
    end
  end
  def destroy
    @fav_beer = FavBeer.find(params[:id])
    @fav_beer.destroy
  end
end
