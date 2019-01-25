# frozen_string_literal: true

require 'httparty'
require 'json'

class BreweriesFeeder
  def initialize
    @key = Beerly::Application.credentials.beer_api_key
  end

  def feed
    File.open('db/breweries.json', 'w') do |f|
      (1..237).each do |i|
        brewery = HTTParty.get("https://api.brewerydb.com/v2/breweries?p=#{i}&key=#{@key}")
        f.write(brewery.to_json)
        puts i
      end
    end
  end

  def perform
    initialize
    feed
  end
end
