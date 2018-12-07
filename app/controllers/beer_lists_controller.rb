class BeerListsController < ApplicationController

  def new 
    @beerlist = BeerList.new 
  end 

  def index
    @beerlist = BeerList.where(bar_id: current_manager.bar.id)
  end

  def create
    @beerlist = current_manager.bar.beer_lists.create(beerlist_params)    
    redirect_to edit_managers_bar_path(current_manager.bar.id)
  end

  def edit
    @beerlist = BeerList.find(params[:id]) 
  end

  def update
    @beerlist = BeerList.find(params[:id]) 
    @beerlist.update(beerlist_params)
    redirect_to edit_managers_bar_path(current_manager.bar.id)
  end

  def destroy
    @beerlist = BeerList.find(params[:id])
    @beerlist.destroy
    redirect_to edit_managers_bar_path(current_manager.bar.id)
  end

  def archive
  end 

  private 
    def beerlist_params
      params.require(:beer_list).permit(:beer_id, :pint_price, :half_pint_price, :bottle_price)
    end 
end
