class AddNotifyColumnToNotes < ActiveRecord::Migration[5.0]
  def change
  	add_column :notes, :notify, :boolean
  end
end
