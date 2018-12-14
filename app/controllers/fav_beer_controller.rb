class FavBeerController < ApplicationController
  def create
    chosen_beer = Beer.find(favbeer_params)
    wishlist = current_user.beer_wishlist
    if wishlist.fav_beers.include?(chosen_beer)
      redirect_to users_bar_wishlists_path, alert: "Cette bière est déjà dans tes favoris !"
    elsif current_user.beer_wishlist.fav_beers.count == 3
      redirect_to users_bar_wishlists_path, alert: "Tu ne peux avoir que trois bières en favori !"
    else 
      @fav_beer = current_user.beer_wishlist.fav_beers.create(chosen_beer)
      redirect_to users_bar_wishlists_path
    end
  end

  def destroy
    @fav_beer = FavBeer.find(params[:id])
    @fav_beer.destroy
  end

  def index 
    @beers = Beer.search(params[:term])
    @fav_beer = FavBeer.new
  end 

  private 
    def favbeer_params
      params.require(:fav_beer).permit(:beer_id)
    end 

end