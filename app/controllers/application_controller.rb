# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :success, :warning, :danger, :info
  layout :layout_by_resource

  def location
    respond_to do |format|
      case params[:type]
      when 'a'
        format.json do
          search = Bar.search(params['term'], [params['lat'], params['lng']])
          render json: { data: search }
        end
      when 'b'
        format.json do
          search = Bar.search_cat(params['term'], [params['lat'], params['lng']])
          render json: { data: search }
        end
      end
    end
  end

  private

  def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end
end
