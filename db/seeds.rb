require 'json'

  cat = JSON.parse(File.read('db/categories.json'))
  cat["data"].each do |x|
    Category.create!(name:"#{x["name"]}")
  end

  style = JSON.parse(File.read('db/styles.json'))
  style["data"].each do |x|
    Style.create!(name:"#{x["name"]}", category_id: "#{x["category"]["id"]}")
  end


