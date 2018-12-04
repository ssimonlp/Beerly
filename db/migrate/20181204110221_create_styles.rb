class CreateStyles < ActiveRecord::Migration[5.2]
  def change
    create_table :styles do |t|
      t.string :name
      t.belongs_to :category, index: true
      t.timestamps
    end
  end
end
