class CreateBars < ActiveRecord::Migration[5.2]
  def change
    create_table :bars do |t|
      t.references :manager, foreign_key: true
      t.string :name
      t.text :address
      t.string :photo
      t.text :opening_time
      t.text :happy_hours
      t.text :description
      t.decimal :lat, {:precision=>10, :scale=>6}, optional: true 
      t.decimal :lng, {:precision=>10, :scale=>6}, optional: true 
      t.boolean :state, default: false 

      t.timestamps
    end
  end
end
