class CreateBars < ActiveRecord::Migration[5.2]
  def change
    create_table :bars do |t|
      t.references :manager, foreign_key: true
      t.string :name, optional: true
      t.text :address, optional: true
      t.string :photo, optional: true
      t.text :opening_time, optional: true
      t.text :happy_hours, optional: true
      t.text :description, optional: true
      t.decimal :lat, {:precision=>10, :scale=>6}, optional: true 
      t.decimal :lng, {:precision=>10, :scale=>6}, optional: true 


      t.timestamps
    end
  end
end
