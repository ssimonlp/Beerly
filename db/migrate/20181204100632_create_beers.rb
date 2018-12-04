class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :image_url, optional: true
      t.text :description, optional: true
      t.decimal :abv
      t.decimal :ibu
      t.boolean :verified, default: false
      t.belongs_to :category, index: true
      t.belongs_to :style, index: true
      t.belongs_to :brewery, index: true
      t.timestamps
    end
  end
end
