class FixLatLongColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :bars, :lat, :latitude
    rename_column :bars, :lng, :longitude
  end
end
