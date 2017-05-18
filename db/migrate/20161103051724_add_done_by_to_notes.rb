class AddDoneByToNotes < ActiveRecord::Migration[5.0]
  def change
  	add_column :notes, :doneBy, :integer # userID of user who changed this note to done.
  end
end
