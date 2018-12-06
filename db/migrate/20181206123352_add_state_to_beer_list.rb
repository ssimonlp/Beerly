class AddStateToBeerList < ActiveRecord::Migration[5.2]
  def change
    add_column :beer_lists, :is_archived, :boolean, default: false
  end
end
