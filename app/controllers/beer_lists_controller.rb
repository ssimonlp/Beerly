class BeerListsController < ApplicationController

  def new 
    @beerlist = BeerList.new 
  end 

  def index
    @bar = Bar.find(current_manager.bar.id)
    @draft_beers = @bar.beer_lists.draft
    @bottle_beers = @bar.beer_lists.bottle
    @beers = Beer.search(params[:term])
    @beerlist = BeerList.new
  end

  def create
    #EMPëcher de créer l'objet s'ils ont pas mis les prix
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


  private 
    def beerlist_params
      params.require(:beer_list).permit(:beer_id, :pint_price, :half_pint_price, :bottle_price)
    end 
end
