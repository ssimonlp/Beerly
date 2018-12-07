class BeersController < ApplicationController
  
  def new
    @beer = Beer.new
  end

  def index
    if params[:term]
      @beers = Beer.search(params[:term])
    else 
      @beers = nil
    end 
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


