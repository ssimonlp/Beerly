# frozen_string_literal: true

class CreateFavBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :fav_beers do |t|
      t.belongs_to :beer_wishlist, index: true
      t.belongs_to :beer, index: true
      t.timestamps
    end
  end
end
