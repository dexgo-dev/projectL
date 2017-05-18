class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.integer :participant_id
      t.text :note_text
      t.boolean :important
      t.integer :user_id
      t.datetime :notify_on

      t.timestamps
    end
  end
end
