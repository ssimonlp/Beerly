class ApplicationController < ActionController::Base
  add_flash_types :success, :warning, :danger, :info

  layout :layout_by_resource
  
  def location
    respond_to do |format|
      format.json {
        search = Bar.search(params["beer"], [params["lat"], params["lng"]]);
        render json: { :data => search }
        }
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
