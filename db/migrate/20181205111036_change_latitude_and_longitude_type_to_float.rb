# frozen_string_literal: true

class ChangeLatitudeAndLongitudeTypeToFloat < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        change_column :bars, :latitude, :float
        change_column :bars, :longitude, :float
      end
      dir.down do
        change_column :bars, :latitude, :decimal
        change_column :bars, :longitude, :decimal
      end
    end
  end
end
