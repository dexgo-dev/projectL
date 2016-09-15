class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :full_name
      t.string :email
      t.string :contact_number
      t.integer :team_id
      t.integer :supervisor_id

      t.timestamps
    end
  end
end
