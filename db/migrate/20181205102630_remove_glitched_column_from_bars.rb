class RemoveGlitchedColumnFromBars < ActiveRecord::Migration[5.2]
  def change
    remove_column :bars, :"{:precision=>10, :scale=>6}"
  end
end
