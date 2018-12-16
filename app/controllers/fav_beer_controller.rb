class FavBeerController < ApplicationController
  def create
    if has_already_three_favorite_beers
      redirect_to users_bar_wishlists_path, alert: 'Tu ne peux avoir que trois bières en favori !'
    elsif beer_is_already_in_favorites
      redirect_to users_bar_wishlists_path,
      alert: 'Cette bière est déjà dans tes favoris !'
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

<<<<<<< HEAD
  def favbeer_params
    params.require(:fav_beer).permit(:beer_id)
  end
end
=======
    def has_already_three_favorite_beers
      current_user.beer_wishlist.fav_beers.count == 3
    end
  
    def beer_is_already_in_favorites
      wishlist.beers.include?(Beer.find((params[:fav_beer][:beer_id]).to_i))
    end
end
>>>>>>> dev
