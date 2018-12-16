# frozen_string_literal: true

require 'httparty'
require 'json'

class StylesFeeder
  def initialize
    @key = Beerly::Application.credentials.beer_api_key
  end

  def styles
    File.open('db/styles.json', 'w') do |f|
      style = HTTParty.get("https://api.brewerydb.com/v2/styles?key=#{@key}")
      f.write(style.to_json)
    end
  end

  def perform
    initialize
    styles
  end
end
