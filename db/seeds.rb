require 'json'
require 'csv'

Bar.destroy_all
Manager.destroy_all
Category.destroy_all
Style.destroy_all
Brewery.destroy_all
BeerList.destroy_all
Beer.destroy_all

puts "Loading files..."

categories = JSON.parse(File.read('db/categories.json'))
puts "Parsed categories"

styles = JSON.parse(File.read('db/styles.json'))
puts "Parsed styles"

breweries = JSON.parse(File.read('db/breweries.json'))
puts "Parsed breweries"

parsed_beers = CSV.foreach('db/beers.csv', headers: true).map(&:to_h)
puts "Parsed beers"

parsed_bars = CSV.foreach('db/bars.csv', headers: true).map(&:to_h)
p parsed_bars
puts "Parsed bars"

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
  a = Beer.new(beer)
  a.save(validate: false)
end
puts "Seeded beers" 

parsed_bars.count.times do |i|
  Manager.create!(email: "manager#{i}@gmail.com", password: "123456", password_confirmation: "123456")
end
puts "Seeded managers"

parsed_bars.each_with_index do |bar, i|
  Bar.create!(manager_id: i + 1, name: bar['name'], address: bar['address'], description: bar['description'], photo: bar['photo'])
end
puts "Seeded bars"

parsed_bars.count.times do |i|
  (rand(10) + 1).times do
    BeerList.create!(beer_id: rand(Beer.count) + 1, bar_id: i + 1, pint_price: rand(7) + 1, half_pint_price: rand(2) + 1)
    BeerList.create!(beer_id: rand(Beer.count) + 1, bar_id: i + 1, bottle_price: rand(10) + 1)
  end
end 

puts "Populated their beerlists"
