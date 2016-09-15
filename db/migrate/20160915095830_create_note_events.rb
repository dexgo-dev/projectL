class CreateNoteEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :note_events do |t|
      t.integer :note_id
      t.integer :event_type_id
      t.integer :user_id
      t.text :note_text

      t.timestamps
    end
  end
end
