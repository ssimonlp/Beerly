class BeerListsController < ApplicationController

  def index
    @beerlist = BeerList.where(bar_id: current_manager.bar.id)
  end

  def create
    @beerlist = BeerList.create(beerlist_params)
  end

  def update
    @beerlist = BeerList.find(bar_params)
    @beerlist.update(berlist_params)
  end

  def destroy
    @beerlist = BeerList.find(params[:id])
    @beerlist.destroy 
  end

  def archive
  end 

  private 
    def beerlist_params
      params.require(:beerlist).permit(:beer_id, :manager_id, :pint_price, :half_pint_price, :bottle_price)
    end 
end
