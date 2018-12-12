class BarWishlistsController < ApplicationController
  
  def new
    @barwishlist = BarWishlist.new
  end 

  def create
    @barwishlist = current_user.bar_wishlists.create(barwishlist_params)
    return 
  end 

  def index
    @bars_on_wishlist = current_user.bar_wishlists
  end

  def destroy
    @barwishlist = BarWishlist.find(params[:id])
    @barwishlist.destroy
  end 

  def visit
    @barwishlist = BarWishlist.find(params[:id])
    if @barwishlist.is_visited?
      @barwishlist.update_attributes(is_visited: false)
      redirect_to users_bar_wishlists_path
    else
      @barwishlist.update_attributes(is_visited: true)
      redirect_to users_bar_wishlists_path
    end 
  end 

private

  def barwishlist_params
    params.require(:bar_wishlist).permit(:bar_id)
  end 

end
