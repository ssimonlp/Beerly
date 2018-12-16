# frozen_string_literal: true

require 'httparty'
require 'csv'
require 'nokogiri'
require 'open-uri'

class BeersFeeder
  def initialize
    @key = Beerly::Application.credentials.brewery_db
    @search_url = 'https://www.brewerydb.com/search?q='
  end

  def get_beers
    beers = []
    file = File.open('db/beer.txt', 'r')
    file.each_line do |line|
      beers << line[0..-2]
    end
    beers
  end

  def get_ids(beers)
    beer_ids = []
    beers.each do |beer|
      webpage = Nokogiri::HTML(open(@search_url + URI.encode(beer)))
      id = webpage.xpath('//*[@id="beers"]/ul/li[1]/div/div/div[1]/a')[0]['href']
      beer_ids << id[-6..-1]
    end
    beer_ids
  end

  def get_data(ids)
    data = []
    ids.each do |beer_id|
      beer = HTTParty.get("https://api.brewerydb.com/v2/beer/#{beer_id}?withBreweries=Y&key=" + @key)
      parsed_data = beer.parsed_response['data']
      p beer
      data << [parsed_data['name'], parsed_data['labels'] ? parsed_data['labels']['icon'] : nil, parsed_data['description'], parsed_data['abv'], parsed_data['style']['categoryId'], parsed_data['style']['id'], parsed_data['breweries'][0]['id']]
    end
    data
  end

  def write(data)
    header = %w[name image_url description abv category_id style_id brewery_id]
    CSV.open('db/beers.csv', 'wb', quote_char: '"') do |file|
      file << header
      data.each do |beer|
        file << beer
      end
    end
  end

  def perform
    beers = get_beers
    ids = get_ids(beers)
    data = get_data(ids)
    write(data)
  end
end
