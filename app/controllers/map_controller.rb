class MapController < ApplicationController
  def index
     if params[:term]
      @bars = Bar.search_by_beer(params[:term])
    else
      @bars = Bar.all
    end
    @geographic_center = geographic_center(@bars)
   

  end
  
  private
  
  def geographic_center(bars)
    arr = []
    bars.each do |bar|
      arr << [bar.latitude, bar.longitude]
    end
    Geocoder::Calculations.geographic_center(arr)
  end
end
