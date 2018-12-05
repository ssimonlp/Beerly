require 'httparty'
require 'json'

class BeersFeeder
  def initialize
    @key = Beerly::Application.credentials.beer_sandbox_key
  end
  def beers
    File.open("db/beers.json","w") do |f|
      beer = HTTParty.get("https://sandbox-api.brewerydb.com/v2/beers?withBreweries=Y&key=#{@key}")
      f.write(beer.to_json)
    end
  end

  def perform
    initialize
    beers
  end
end
