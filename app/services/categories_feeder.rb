require 'httparty'
require 'json'

class CategoriesFeeder
  def initialize
    @key = Beerly::Application.credentials.beer_api_key
  end
  def categories
    File.open("db/categories.JSON","w") do |f|
      categories = HTTParty.get("https://api.brewerydb.com/v2/categories?key=#{@key}")
      f.write(categories.to_json)
    end
  end

  def perform
    initialize
    categories
  end
end
