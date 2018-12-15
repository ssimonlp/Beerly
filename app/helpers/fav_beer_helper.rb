module FavBeerHelper

  def has_already_three_favorite_beers
    current_user.beer_wishlist.fav_beers.count == 3
  end

  def beer_is_already_in_favorites
    wishlist.beers.include?(Beer.find((params[:fav_beer][:beer_id]).to_i))
  end

end
