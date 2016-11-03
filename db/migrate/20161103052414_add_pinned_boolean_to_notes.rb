class AddPinnedBooleanToNotes < ActiveRecord::Migration[5.0]
  def change
  	add_column :notes, :isPinned, :boolean 
  end
end
