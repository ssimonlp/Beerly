# frozen_string_literal: true

class CreateBeerLists < ActiveRecord::Migration[5.2]
  def change
    create_table :beer_lists do |t|
      t.decimal :pint_price, optional: true
      t.decimal :half_pint_price, optional: true
      t.decimal :bottle_price, optional: true
      t.references :beer, foreign_key: true
      t.references :bar, foreign_key: true

      t.timestamps
    end
  end
end
