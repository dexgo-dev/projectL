class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.text :description
      t.integer :contact_user
      t.string :group_email

      t.timestamps
    end
  end
end
