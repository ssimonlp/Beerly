class BeerListsController < ApplicationController

  def new 
    @beerlist = BeerList.new 
  end 

  def index
    @bar = Bar.find(current_manager.bar.id)
    @draft_beers = @bar.beer_lists.draft.up
    @bottle_beers = @bar.beer_lists.bottle.up
    @beers = Beer.search(params[:term])
    @beerlist = BeerList.new
    @archived_beers = @bar.beer_lists.archived
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
    redirect_to managers_beer_lists_path
  end

  def archive
    @beerlist = BeerList.find(params[:id]) 
    if @beerlist.is_archived?
      @beerlist.update_attributes(is_archived: false)
      redirect_to managers_beer_lists_path
    else
      @beerlist.update_attributes(is_archived: true)
      redirect_to managers_beer_lists_path
    end 
  end 

  private 
    def beerlist_params
      params.require(:beer_list).permit(:beer_id, :pint_price, :half_pint_price, :bottle_price)
    end 
end
