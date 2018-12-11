class AutocompleteController < ApplicationController
  require 'pry'
  def index

    respond_to do |format|
     format.json { render json: { data: Beer.search_beer(params[:term]).limit(5)}  } 
    end
  end
end

