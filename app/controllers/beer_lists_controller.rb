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
    redirect_to managers_beer_lists_path
  end

  def edit
    @beerlist = BeerList.find(params[:id]) 
  end

  def update
    @beerlist = BeerList.find(params[:id]) 
    @beerlist.update(beerlist_params)
    redirect_to managers_beer_lists_path
  end

  def destroy
    @beerlist = BeerList.find(params[:id])
    @beerlist.destroy

      respond_to do |format|
        format.html { redirect_to managers_beer_lists_url }
        format.json { head :no_content }
        format.js
      end
  end


  private 
    def beerlist_params
      params.require(:beer_list).permit(:beer_id, :pint_price, :half_pint_price, :bottle_price)
    end 
end
