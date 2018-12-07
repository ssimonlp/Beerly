require 'json'
require 'csv'


=begin 

Category.destroy_all
Style.destroy_all
Brewery.destroy_all
Beer.destroy_all

puts "Loading files..."

categories = JSON.parse(File.read('db/categories.json'))
puts "Parsed categories"

styles = JSON.parse(File.read('db/styles.json'))
puts "Parsed styles"

breweries = JSON.parse(File.read('db/breweries.json'))
puts "Parsed breweries"

beers = File.read('db/beer.csv')
parsed_beers = CSV.parse(beers, quote_char: "|", col_sep: ';', headers: true).map(&:to_h)
puts "Parsed beers"

categories["data"].each do |category|
  Category.create(name: category["name"])
end
puts "Seeded categories"

styles["data"].each do |style|
  Style.create!(name: style["name"], category_id: style["categoryId"])
end
puts "Seeded styles"

breweries.each do |bewery|
  bewery["data"].each do |data|
    Brewery.create(name: data["name"], image_url: data["images"] ? data["images"]["medium"] : nil, verified: true)
  end
end
puts "Seeded breweries"

parsed_beers.each do |beer|
  Beer.create(beer)
end
puts "Seeded beers"

=end 

10.times do 
  beerlist = BeerList.create!(beer_id:1, bar_id:6, pint_price:5, half_pint_price:2.5)
  beerlist = BeerList.create!(beer_id:1, bar_id:6, bottle_price:7)
end 


