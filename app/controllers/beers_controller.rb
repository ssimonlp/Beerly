class BeersController < ApplicationController
  
  before_action 

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
     
end


