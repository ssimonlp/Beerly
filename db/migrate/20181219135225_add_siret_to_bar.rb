class AddSiretToBar < ActiveRecord::Migration[5.2]
  def change
    add_column :bars, :siret, :decimal, precision: 14, scale: 0
  end
end
