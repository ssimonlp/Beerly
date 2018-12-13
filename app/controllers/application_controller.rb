require 'pry'
class ApplicationController < ActionController::Base
  add_flash_types :success, :warning, :danger, :info

  layout :layout_by_resource
  
  def location
  binding.pry
    respond_to do |format|
      if params["beer"]
        format.json {
          search = Bar.search(params["term"], [params["lat"], params["lng"]]);
          render json: { :data => search }
        }
      elsif params["category"]
        format.json {
          search = Bar.search_cat(params["term"], [params["lat"], params["lng"]]);
          render json: { :data => search }
        }
     end
    end
  end
  
  private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
end
