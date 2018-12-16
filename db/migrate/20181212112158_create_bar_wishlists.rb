# frozen_string_literal: true

class CreateBarWishlists < ActiveRecord::Migration[5.2]
  def change
    create_table :bar_wishlists do |t|
      t.references :bar, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :is_visited, default: false

      t.timestamps
    end
  end
end
