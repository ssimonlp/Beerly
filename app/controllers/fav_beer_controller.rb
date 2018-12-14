class FavBeerController < ApplicationController
  def create
    wishlist = current_user.beer_wishlist
    if current_user.beer_wishlist.fav_beers.count == 3
      redirect_to users_bar_wishlists_path, alert: "Tu ne peux avoir que trois bières en favori !"
    elsif wishlist.beers.include?(Beer.find((params[:fav_beer][:beer_id]).to_i))
      redirect_to users_bar_wishlists_path, alert: "Cette bière est déjà dans tes favoris !"
    else 
      @fav_beer = current_user.beer_wishlist.fav_beers.create(favbeer_params)
      redirect_to users_bar_wishlists_path
    end
  end

  def destroy
    @fav_beer = FavBeer.find(params[:id])
    @fav_beer.destroy
    redirect_to users_bar_wishlists_path
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