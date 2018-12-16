# frozen_string_literal: true

class ChangeLatitudeAndLongitudeTypeToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :bars, :latitude, :float
    change_column :bars, :longitude, :float
  end
end
