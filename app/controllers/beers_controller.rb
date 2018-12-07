class BeersController < ApplicationController
  
  def new
    @beer = Beer.new
  end

  def index
    @beers = Beer.search(params[:term])
    @beerlist = BeerList.new 
  end

  def show
    @beer = Beer.find(params[:id])
  end


  private 
    def beer_params
      params.require(:beer).permit(:name)
    end     
end


