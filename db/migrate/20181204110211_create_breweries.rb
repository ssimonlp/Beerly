class CreateBreweries < ActiveRecord::Migration[5.2]
  def change
    create_table :breweries do |t|
      t.string :name
      t.boolean :verified, default: false
      t.string :image_url, optional: true
      t.timestamps
    end
  end
end
