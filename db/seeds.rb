require 'json'
require 'csv'

  cat = JSON.parse(File.read('db/categories.json'))
  cat["data"].each do |x|
    Category.create!(name:"#{x["name"]}")
  end

  style = JSON.parse(File.read('db/styles.json'))
  style["data"].each do |x|
    Style.create!(name:"#{x["name"]}", category_id: "#{x["category"]["id"]}")
  end

  brew = JSON.parse(File.read('db/breweries.json'))
  brew.each do |x|
    x["data"].each do |y|
     b =  Brewery.new
     b.name = y["name"]
     #if y["images"]["medium"] != nil
      b.image_url = (y["images"] != nil ?y["images"]["medium"] : nil)
     #end
     b.verified = true
     b.save
    end
  end


csv_text = File.read('db/beer.csv')
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1',:quote_char => "|")
 csv.each do |row|
  t = Beer.new
 t.name = row['name']
 puts row['name']
 t.image_url = row['image_url']
 t.description = row['description']
 t.abv = row['abv']
 t.ibu = row['ibu']
 t.category_id = row['category_id']
 t.style_id = row['style_id']
 t.save
 end


