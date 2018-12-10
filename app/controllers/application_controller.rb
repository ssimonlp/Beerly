class ApplicationController < ActionController::Base
  add_flash_types :success, :warning, :danger, :info

  layout :layout_by_resource

	  private

	  def layout_by_resource
	    if devise_controller?
	      "devise"
	    else
	      "application"
	    end
	  end
end
