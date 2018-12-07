class BeerListsController < ApplicationController

  def new 
    @beerlist = BeerList.new 
  end 

  def index
    @beerlist = BeerList.where(bar_id: current_manager.bar.id)
  end

  def create
    @beerlist = BeerList.create!(allowed_params)
    respond_to do |f|
      f.html {redirect_to beer_lists_url}
      f.js
    end 
  end

  def update
    @beerlist = BeerList.find(params[:id])
    @beerlist.update_attributes?(allowed_params)

    respond_to do |f|
      f.html {redirect to beer_lists_url }
      f.js
    end 
  end

  def destroy
    @beerlist = BeerList.find(params[:id])
    @beerlist.destroy 
    respond_to do |format|
      format.html {redirect_to beer_lists_url}
      format.json {head :no_content}
      format.js {render :layout => false}
    end 
  end

  def archive
  end 

  private 
    def beerlist_params
      params.require(:beerlist).permit(:beer_id, :manager_id, :pint_price, :half_pint_price, :bottle_price)
    end 
end
