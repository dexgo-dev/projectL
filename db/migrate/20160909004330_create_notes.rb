class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.text :note_text
      t.integer :participant_id
      t.integer :user_id
      t.boolean :important
      t.datetime :notify_on

      t.timestamps
    end
  end
end
