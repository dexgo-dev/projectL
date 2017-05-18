class AddUpdatedByToNotes < ActiveRecord::Migration[5.0]
  def change
  	add_column :notes, :updated_by, :integer # user_id of user who did last update
  end
end
