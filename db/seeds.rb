require 'json'

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
