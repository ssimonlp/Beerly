require 'json'
require 'csv'


begin 

Category.destroy_all
Style.destroy_all
Brewery.destroy_all
BeerList.destroy_all
Beer.destroy_all
Manager.destroy_all
Bar.destroy_all


puts "Loading files..."

categories = JSON.parse(File.read('db/categories.json'))
puts "Parsed categories"

styles = JSON.parse(File.read('db/styles.json'))
puts "Parsed styles"

breweries = JSON.parse(File.read('db/breweries.json'))
puts "Parsed breweries"

beers = File.read('db/beers.csv')
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

end 


Manager.create!(email: "juliette@gmail.com", password: "123456", password_confirmation: "123456")
puts "Created one manager"

Bar.create!(manager_id:1, name:"Le Grand BégueT", address:"3 villa condorcet",description:"Yola notre bar il est trop cool",photo:"La plus belle des photos")
puts "Created their bar"

10.times do 
  beerlist = BeerList.create!(beer_id:1, bar_id:1, pint_price:5, half_pint_price:2.5)
  beerlist = BeerList.create!(beer_id:1, bar_id:1, bottle_price:7)
end 

puts "Populated their beerlists"
