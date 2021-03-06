# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def show
    render template: "static_pages/#{params[:page]}"
  end
end
