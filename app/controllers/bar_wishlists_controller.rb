# frozen_string_literal: true

class BarWishlistsController < ApplicationController
  before_action :check_wishlist

  def index
    @bars_on_wishlist = current_user.bar_wishlists
    @bars_visited = current_user.bar_wishlists.visited
    @bars_to_visit = current_user.bar_wishlists.to_visit
    @beers = Beer.search(params[:term])
    @fav_beer = FavBeer.new
    @favorite_beers = current_user.beer_wishlist.fav_beers
  end

  def new
    @barwishlist = BarWishlist.new
  end

  def create
    barwishlist = current_user.bars
    bar = (params[:bar_wishlist][:bar_id]).to_i
    if barwishlist.include?(Bar.find(bar))
      redirect_to bar_path(bar), alert: 'Ce bar est déjà dans tes favoris !'
    else
      @barwishlist = current_user.bar_wishlists.create(barwishlist_params)
      redirect_to bar_path(bar), alert: 'Bar ajouté dans tes favoris !'
    end
  end

  def destroy
    @barwishlist = BarWishlist.find(params[:id])
    @barwishlist.destroy
    redirect_to users_bar_wishlists_path
  end

  def visit
    @barwishlist = BarWishlist.find(params[:id])
    if @barwishlist.is_visited?
      @barwishlist.update_attributes(is_visited: false)
    else
      @barwishlist.update_attributes(is_visited: true)
    end
    redirect_to users_bar_wishlists_path
  end

  private

  def barwishlist_params
    params.require(:bar_wishlist).permit(:bar_id)
  end

  def check_wishlist
    BeerWishlist.create(user_id: current_user.id) if BeerWishlist.find_by(user_id: current_user.id).nil?
  end
end
