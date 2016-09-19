class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :gender
      t.string :contact_number
      t.text :home_address
      t.boolean :active
      t.integer :study_id
      t.date :date_of_birth
      t.string :email

      t.timestamps
    end
  end
end
