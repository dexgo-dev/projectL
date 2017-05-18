class AddDoneBooleanAndDoneDateToNotes < ActiveRecord::Migration[5.0]
  def change
  	add_column :notes, :isDone, :boolean
  	add_column :notes, :doneOn, :datetime
  end
end
