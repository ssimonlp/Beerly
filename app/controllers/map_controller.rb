class MapController < ApplicationController
  def index
    @geographic_center = geographic_center(@pubs)
    if params[:term]
      @pubs = Bar.search_by_beer(params[:term])
    else
      @pubs = Bar.all
    end

  end
  
  def show
   
  end
  
  private
  
  def geographic_center(pubs)
    arr = []
    pubs.each do |pub|
      arr << [pub.latitude, pub.longitude]
    end
    Geocoder::Calculations.geographic_center(arr)
  end
end
