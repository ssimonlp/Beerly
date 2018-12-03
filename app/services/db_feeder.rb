require 'httparty'
require 'json'
require 'dotenv'
Dotenv.load
class DbFeeder
  def initialize
    @key = ENV['SANDBOX_KEY']
  end
  
  def feed
    File.open("db/beers.JSON","w") do |f|
      for i in 1..23
        beer = HTTParty.get("https://sandbox-api.brewerydb.com/v2/beers?p=#{i}&key=#{@key}")
        f.write(beer.to_json)
      end
    end
  end

  def perform
    initialize
    feed
  end
end
