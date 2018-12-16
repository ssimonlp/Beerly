# frozen_string_literal: true

class BeersController < ApplicationController
  def new
    @beer = Beer.new
  end

  def index
    @beers = Beer.search(params[:term])
    @beerlist = BeerList.new
    @fav_beer = FavBeer.new
  end

  def show
    @beer = Beer.find(params[:id])
  end
end
